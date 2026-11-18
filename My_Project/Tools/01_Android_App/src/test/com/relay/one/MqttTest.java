package com.relay.one;

/** MQTT 客户端联通性测试（真的连公网 broker）：java -cp testout com.relay.one.MqttTest [host] [port] */
public final class MqttTest {

    private static final Object lock = new Object();
    private static volatile String lastTopic;
    private static volatile String lastPayload;
    private static volatile boolean subscribed;

    public static void main(String[] args) {
        String host = args.length > 0 ? args[0] : "broker.emqx.io";
        int port = args.length > 1 ? Integer.parseInt(args[1]) : 1883;
        String topic = "relayapp/test/" + Long.toHexString(System.nanoTime());
        String clientId = "relaytest-" + Long.toHexString(System.nanoTime() & 0xFFFFFFFFL);

        System.out.println("broker = " + host + ":" + port);
        System.out.println("topic  = " + topic);

        Mqtt.Listener listener = new Mqtt.Listener() {
            @Override
            public void onConnected() {
                System.out.println("PASS 已连接（CONNACK 正常）");
            }

            @Override
            public void onSubscribed() {
                subscribed = true;
                System.out.println("PASS 订阅成功（SUBACK）");
                synchronized (lock) {
                    lock.notifyAll();
                }
            }

            @Override
            public void onMessage(String t, String p) {
                lastTopic = t;
                lastPayload = p;
                System.out.println("PASS 收到消息 topic=" + t + " payload=" + p);
                synchronized (lock) {
                    lock.notifyAll();
                }
            }

            @Override
            public void onClosed(String reason) {
                System.out.println("INFO 连接关闭: " + reason);
            }

            @Override
            public void onError(String message) {
                System.out.println("FAIL " + message);
            }
        };

        Mqtt mqtt = new Mqtt(host, port, clientId, "", "", 60, listener);
        int fails = 0;
        try {
            mqtt.connect();
        } catch (Exception e) {
            System.out.println("FAIL 连接失败: " + e.getMessage());
            System.exit(1);
        }

        try {
            mqtt.subscribe(topic);
        } catch (Exception e) {
            System.out.println("FAIL 订阅失败: " + e.getMessage());
            fails++;
        }

        // 等 SUBACK
        long deadline = System.currentTimeMillis() + 6000;
        synchronized (lock) {
            while (!subscribed && System.currentTimeMillis() < deadline) {
                try {
                    lock.wait(200);
                } catch (InterruptedException e) {
                    break;
                }
            }
        }
        if (!subscribed) {
            System.out.println("FAIL 没收到 SUBACK");
            fails++;
        }

        // 发一条，验证 broker 会把它回推给我们（这解释了 App 里为什么要过滤自己的回显）
        try {
            mqtt.publish(topic, "a1");
        } catch (Exception e) {
            System.out.println("FAIL 发布失败: " + e.getMessage());
            fails++;
        }
        deadline = System.currentTimeMillis() + 6000;
        synchronized (lock) {
            while (lastPayload == null && System.currentTimeMillis() < deadline) {
                try {
                    lock.wait(200);
                } catch (InterruptedException e) {
                    break;
                }
            }
        }
        if ("a1".equals(lastPayload)) {
            System.out.println("PASS 回环消息收到（payload=a1，App 需要按内容过滤自己的发送）");
        } else {
            System.out.println("FAIL 没收到回环消息，lastPayload=" + lastPayload);
            fails++;
        }

        // 再发一条带 = 和逗号的组合指令，验证 UTF-8/ASCII 原样传输
        lastPayload = null;
        try {
            mqtt.publish(topic, "zh=a1,b1");
        } catch (Exception e) {
            fails++;
        }
        deadline = System.currentTimeMillis() + 6000;
        synchronized (lock) {
            while (lastPayload == null && System.currentTimeMillis() < deadline) {
                try {
                    lock.wait(200);
                } catch (InterruptedException e) {
                    break;
                }
            }
        }
        if ("zh=a1,b1".equals(lastPayload)) {
            System.out.println("PASS 组合指令原样传输");
        } else {
            System.out.println("FAIL 组合指令异常: " + lastPayload);
            fails++;
        }

        mqtt.disconnect();
        System.out.println("FAILS: " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
