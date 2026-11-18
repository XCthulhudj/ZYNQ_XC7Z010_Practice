package com.relay.one;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * 极简 MQTT 3.1.1 客户端（QoS0 发布，QoS0/1 订阅），不依赖任何第三方库。
 * 只实现这个项目需要的部分：CONNECT / SUBSCRIBE / PUBLISH / PING。
 */
public final class Mqtt {

    public interface Listener {
        void onConnected();

        void onSubscribed();

        void onMessage(String topic, String payload);

        void onClosed(String reason);

        void onError(String message);
    }

    private final String host;
    private final int port;
    private final String clientId;
    private final String user;
    private final String pass;
    private final int keepAlive;
    private final Listener listener;

    private Socket socket;
    private OutputStream out;
    private Thread reader;
    private Thread pinger;
    private volatile boolean running;
    private final CountDownLatch connack = new CountDownLatch(1);
    private volatile int connackCode = -1;
    private volatile String closeReason = "已断开";

    public Mqtt(String host, int port, String clientId, String user, String pass, int keepAlive, Listener l) {
        this.host = host;
        this.port = port;
        this.clientId = clientId;
        this.user = user == null ? "" : user;
        this.pass = pass == null ? "" : pass;
        this.keepAlive = keepAlive <= 0 ? 60 : keepAlive;
        this.listener = l;
    }

    public boolean isRunning() {
        return running;
    }

    // ---------------- 对外 ----------------
    public void connect() throws IOException {
        closeQuietly();
        Socket s = new Socket();
        try {
            s.connect(new InetSocketAddress(host, port), 8000);
            s.setTcpNoDelay(true);
            s.setKeepAlive(true);
            socket = s;
            out = s.getOutputStream();
            sendConnect();

            running = true;
            reader = new Thread(new Runnable() {
                @Override
                public void run() {
                    readLoop();
                }
            }, "mqtt-read");
            reader.setDaemon(true);
            reader.start();

            if (!connack.await(12, TimeUnit.SECONDS)) {
                running = false;
                throw new IOException("等待 broker 回应超时（12 秒）");
            }
            if (connackCode != 0) {
                running = false;
                throw new IOException("broker 拒绝连接，返回码 " + connackCode
                        + (connackCode == 4 ? "（用户名或密码错误）" : connackCode == 5 ? "（无权限）" : ""));
            }
            startPinger();
            if (listener != null) {
                listener.onConnected();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            throw new IOException("连接被中断");
        } catch (IOException e) {
            closeQuietly();
            throw e;
        }
    }

    public void subscribe(String topic) throws IOException {
        checkRunning();
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        body.write(0x00);
        body.write(0x01);                 // packet id = 1
        writeString(body, topic);
        body.write(0x00);                 // 请求 QoS0
        writePacket(0x82, body.toByteArray());
    }

    public void publish(String topic, String payload) throws IOException {
        checkRunning();
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        writeString(body, topic);
        body.write(payload.getBytes("UTF-8"));
        writePacket(0x30, body.toByteArray());  // PUBLISH, QoS0, 不保留
    }

    /** 取消订阅（自动搜索设备时用）。 */
    public void unsubscribe(String topic) throws IOException {
        checkRunning();
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        body.write(0x00);
        body.write(0x02);                 // packet id = 2
        writeString(body, topic);
        writePacket(0xA2, body.toByteArray());
    }

    /**
     * 断开连接。注意：这里绝不往 socket 写数据 —— 本方法可能被 UI 线程调用，
     * 主线程做网络 I/O 会抛 NetworkOnMainThreadException 直接把 APP 干掉。
     * 直接关 socket，broker 会按 TCP 断开处理（clean session 无需 DISCONNECT 包）。
     */
    public void disconnect() {
        running = false;
        closeQuietly();
    }

    // ---------------- 内部 ----------------
    private void checkRunning() throws IOException {
        if (!running || out == null) {
            throw new IOException("MQTT 未连接");
        }
    }

    private void sendConnect() throws IOException {
        ByteArrayOutputStream body = new ByteArrayOutputStream();
        writeString(body, "MQTT");
        body.write(0x04);                                  // protocol level 3.1.1
        int flags = 0x02;                                  // clean session
        if (user.length() > 0) {
            flags |= 0x80;
        }
        if (pass.length() > 0) {
            flags |= 0x40;
        }
        body.write(flags);
        body.write((keepAlive >> 8) & 0xFF);
        body.write(keepAlive & 0xFF);
        writeString(body, clientId);
        if (user.length() > 0) {
            writeString(body, user);
        }
        if (pass.length() > 0) {
            writeString(body, pass);
        }
        writePacket(0x10, body.toByteArray());
    }

    private synchronized void writePacket(int header, byte[] body) throws IOException {
        if (out == null) {
            throw new IOException("连接已关闭");
        }
        out.write(header);
        int len = body.length;
        do {
            int digit = len % 128;
            len = len / 128;
            if (len > 0) {
                digit = digit | 0x80;
            }
            out.write(digit);
        } while (len > 0);
        out.write(body);
        out.flush();
    }

    private static void writeString(ByteArrayOutputStream b, String s) throws IOException {
        byte[] d = s.getBytes("UTF-8");
        b.write((d.length >> 8) & 0xFF);
        b.write(d.length & 0xFF);
        b.write(d);
    }

    private void readLoop() {
        String reason = "连接被关闭";
        try {
            InputStream in = socket.getInputStream();
            while (running) {
                int header = in.read();
                if (header < 0) {
                    break;
                }
                int multiplier = 1;
                int length = 0;
                int digit;
                do {
                    digit = in.read();
                    if (digit < 0) {
                        throw new IOException("连接中断");
                    }
                    length += (digit & 0x7F) * multiplier;
                    multiplier *= 128;
                } while ((digit & 0x80) != 0);

                byte[] data = new byte[length];
                int off = 0;
                while (off < length) {
                    int n = in.read(data, off, length - off);
                    if (n < 0) {
                        throw new IOException("连接中断");
                    }
                    off += n;
                }
                handlePacket(header, data);
            }
        } catch (Exception e) {
            reason = e.getMessage() == null ? e.getClass().getSimpleName() : e.getMessage();
        } finally {
            boolean wasRunning = running;
            running = false;
            closeQuietly();
            if (wasRunning && listener != null) {
                closeReason = reason;
                listener.onClosed(closeReason);
            }
        }
    }

    private void handlePacket(int header, byte[] data) throws IOException {
        int type = (header >> 4) & 0x0F;
        if (type == 2) {                                  // CONNACK
            connackCode = data.length > 1 ? (data[1] & 0xFF) : -1;
            connack.countDown();
        } else if (type == 3) {                            // PUBLISH
            int qos = ((header & 0x06) >> 1) & 0x03;
            int topicLen = ((data[0] & 0xFF) << 8) | (data[1] & 0xFF);
            String topic = new String(data, 2, topicLen, "UTF-8");
            int pos = 2 + topicLen;
            if (qos > 0) {
                int packetId = ((data[pos] & 0xFF) << 8) | (data[pos + 1] & 0xFF);
                pos += 2;
                if (qos == 1) {
                    byte[] ack = new byte[2];
                    ack[0] = (byte) ((packetId >> 8) & 0xFF);
                    ack[1] = (byte) (packetId & 0xFF);
                    writePacket(0x40, ack);                // PUBACK
                }
            }
            String payload = new String(data, pos, data.length - pos, "UTF-8");
            if (listener != null) {
                listener.onMessage(topic, payload);
            }
        } else if (type == 9) {                            // SUBACK
            if (listener != null) {
                listener.onSubscribed();
            }
        } else if (type == 13) {                           // PINGRESP
            // 心跳正常，无需处理
        }
    }

    private void startPinger() {
        pinger = new Thread(new Runnable() {
            @Override
            public void run() {
                while (running) {
                    try {
                        Thread.sleep(Math.max(10, keepAlive / 2) * 1000L);
                    } catch (InterruptedException e) {
                        return;
                    }
                    if (!running) {
                        return;
                    }
                    try {
                        writePacket(0xC0, new byte[0]);     // PINGREQ
                    } catch (IOException e) {
                        return;
                    }
                }
            }
        }, "mqtt-ping");
        pinger.setDaemon(true);
        pinger.start();
    }

    private void closeQuietly() {
        running = false;
        if (socket != null) {
            try {
                socket.close();
            } catch (IOException ignored) {
            }
            socket = null;
        }
        out = null;
    }
}
