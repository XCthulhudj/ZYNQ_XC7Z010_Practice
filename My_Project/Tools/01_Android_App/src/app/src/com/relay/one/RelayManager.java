package com.relay.one;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * MQTT 连接 + 设备列表 + 状态的唯一管理者（单例）。
 *
 * 多设备：每个设备 = 名字 + 主题（就是设备 ID），共用同一个 MQTT 服务器；
 * 切换设备时自动换主题重连。所有网络读写都在后台线程。
 */
public final class RelayManager {

    public interface Listener {
        void onState();

        void onLog(String line);
    }

    /** 自动搜索设备的回调（主线程）。 */
    public interface DiscoverCallback {
        void onDone(List<Device> found);
    }

    /** 一台设备：名字用来区分，备注写用途（客厅灯 / 水泵 / 路由电源…），主题就是设备 ID。 */
    public static final class Device {
        public String name = "";
        public String topic = "";
        public String note = "";

        public Device() {
        }

        public Device(String name, String topic, String note) {
            this.name = name == null ? "" : name;
            this.topic = topic == null ? "" : topic;
            this.note = note == null ? "" : note;
        }

        /** 胶囊/标题上显示的字。 */
        public String label() {
            return name == null || name.trim().length() == 0 ? topic : name.trim();
        }

        /** 副标题：优先显示备注，没备注就显示主题（设备 ID）。 */
        public String subtitle() {
            if (note != null && note.trim().length() > 0) {
                return note.trim();
            }
            return topic == null ? "" : topic;
        }
    }

    public static final String APP_VER = "v1.4";
    private static final String PREF = "relay";
    private static final int LOG_MAX = 400;
    private static final char FS = '\u0001';
    private static final char RS = '\u0002';

    private static RelayManager instance;

    public static synchronized RelayManager get(Context ctx) {
        if (instance == null) {
            instance = new RelayManager(ctx.getApplicationContext());
        }
        return instance;
    }

    // ---------- 配置 ----------
    public String host = "broker.emqx.io";
    public int port = 1883;
    public String user = "";
    public String pass = "";
    public boolean autoReconnect = true;
    public boolean autoRefresh = true;
    public int pollSec = 5;
    public int pointSec = 10;

    // ---------- 设备列表 ----------
    public final ArrayList<Device> devices = new ArrayList<Device>();
    private int active = -1;

    // ---------- 状态 ----------
    public boolean connected = false;
    public boolean connecting = false;
    public Boolean relay1 = null;
    public Integer signal = null;
    public String devid = "";
    public String version = "";
    public String ssid = "";
    public String ip = "";
    public String ddjyText = "";
    public String panelText = "";
    public long lastUpdate = 0L;
    public String lastError = "";

    private final Context ctx;
    private final SharedPreferences prefs;
    private final Handler ui = new Handler(Looper.getMainLooper());
    private final ExecutorService io = Executors.newSingleThreadExecutor();
    private final List<Listener> listeners = new CopyOnWriteArrayList<Listener>();
    private final LinkedList<String[]> recentSends = new LinkedList<String[]>();
    private final ArrayList<String> logLines = new ArrayList<String>();

    private Mqtt mqtt;
    private boolean wantConnected = false;
    private int reconnectDelay = 5;

    // 自动搜索设备用的临时状态
    private boolean discovering = false;
    private final java.util.LinkedHashMap<String, String> discovered =
            new java.util.LinkedHashMap<String, String>();

    private final Runnable reconnectTick = new Runnable() {
        @Override
        public void run() {
            if (wantConnected && !connected && !connecting) {
                doConnect();
            }
        }
    };
    private final Runnable pollTick = new Runnable() {
        @Override
        public void run() {
            if (connected && autoRefresh) {
                publish("qc", false);
            }
            if (connected) {
                ui.postDelayed(this, Math.max(3, pollSec) * 1000L);
            }
        }
    };

    private RelayManager(Context appContext) {
        this.ctx = appContext;
        this.prefs = appContext.getSharedPreferences(PREF, Context.MODE_PRIVATE);
        load();
    }

    // ---------- 监听 ----------
    public void addListener(Listener l) {
        if (!listeners.contains(l)) {
            listeners.add(l);
        }
    }

    public void removeListener(Listener l) {
        listeners.remove(l);
    }

    public void fireState() {
        ui.post(new Runnable() {
            @Override
            public void run() {
                for (Listener l : listeners) {
                    l.onState();
                }
            }
        });
    }

    private void addLog(final String line) {
        synchronized (logLines) {
            logLines.add(line);
            while (logLines.size() > LOG_MAX) {
                logLines.remove(0);
            }
        }
        ui.post(new Runnable() {
            @Override
            public void run() {
                for (Listener l : listeners) {
                    l.onLog(line);
                }
            }
        });
    }

    public List<String> logSnapshot() {
        synchronized (logLines) {
            return new ArrayList<String>(logLines);
        }
    }

    public void clearLog() {
        synchronized (logLines) {
            logLines.clear();
        }
    }

    // ---------- 设备列表 ----------
    public int activeIndex() {
        return active;
    }

    public Device activeDevice() {
        if (active < 0 || active >= devices.size()) {
            return null;
        }
        return devices.get(active);
    }

    public String activeTopic() {
        Device d = activeDevice();
        return d == null ? "" : d.topic;
    }

    public boolean configured() {
        return activeTopic().trim().length() > 0;
    }

    /** 切换设备：换主题重连，状态清空重新读。 */
    public void selectDevice(int index) {
        if (index < 0 || index >= devices.size() || index == active) {
            return;
        }
        active = index;
        save();
        resetDeviceState();
        addLog("· 切换到设备 " + devices.get(index).label());
        if (connected || connecting) {
            disconnect();
        }
        wantConnected = true;
        connect();
        fireState();
    }

    public void addDevice(String name, String topic) {
        addDevice(name, topic, "");
    }

    public void addDevice(String name, String topic, String note) {
        String t = topic == null ? "" : topic.trim();
        if (t.length() == 0) {
            return;
        }
        String n = name == null ? "" : name.trim();
        if (n.length() == 0) {
            n = t;
        }
        devices.add(new Device(n, t, note == null ? "" : note.trim()));
        active = devices.size() - 1;
        save();
        resetDeviceState();
        addLog("· 添加设备 " + n + "（" + t + "）");
        if (connected || connecting) {
            disconnect();
        }
        wantConnected = true;
        connect();
        fireState();
    }

    public void removeDevice(int index) {
        if (index < 0 || index >= devices.size()) {
            return;
        }
        String name = devices.get(index).label();
        devices.remove(index);
        if (devices.isEmpty()) {
            active = -1;
        } else if (index <= active) {
            active = Math.max(0, active - 1);
        }
        save();
        resetDeviceState();
        addLog("· 删除设备 " + name);
        if (connected || connecting) {
            disconnect();
        }
        if (configured()) {
            wantConnected = true;
            connect();
        }
        fireState();
    }

    public void renameDevice(int index, String name) {
        if (index < 0 || index >= devices.size()) {
            return;
        }
        String n = name == null ? "" : name.trim();
        if (n.length() == 0) {
            return;
        }
        devices.get(index).name = n;
        save();
        fireState();
    }

    /** 一次改名字 + 备注（备注写用途，方便区分）。 */
    public void updateDevice(int index, String name, String note) {
        if (index < 0 || index >= devices.size()) {
            return;
        }
        String n = name == null ? "" : name.trim();
        if (n.length() > 0) {
            devices.get(index).name = n;
        }
        devices.get(index).note = note == null ? "" : note.trim();
        save();
        fireState();
    }

    private void resetDeviceState() {
        relay1 = null;
        signal = null;
        devid = "";
        version = "";
        ssid = "";
        ip = "";
        ddjyText = "";
        panelText = "";
        lastUpdate = 0L;
        lastError = "";
    }

    // ---------- 配置持久化 ----------
    public void load() {
        host = prefs.getString("host", host);
        port = prefs.getInt("port", port);
        user = prefs.getString("user", user);
        pass = prefs.getString("pass", pass);
        autoReconnect = prefs.getBoolean("reconnect", autoReconnect);
        autoRefresh = prefs.getBoolean("auto", autoRefresh);
        pollSec = prefs.getInt("poll", pollSec);
        pointSec = prefs.getInt("sec", pointSec);

        devices.clear();
        String enc = prefs.getString("devices", "");
        if (enc != null && enc.length() > 0) {
            String[] rows = enc.split(String.valueOf(RS));
            for (String row : rows) {
                if (row.length() == 0) {
                    continue;
                }
                String[] parts = row.split(String.valueOf(FS), -1);
                if (parts.length < 2) {
                    continue;
                }
                String n = parts[0];
                String t = parts[1];
                String note = parts.length > 2 ? parts[2] : "";
                if (t.trim().length() > 0) {
                    devices.add(new Device(n, t, note));
                }
            }
        }
        // 从旧版本迁移：旧版只有一个 topic
        if (devices.isEmpty()) {
            String legacy = prefs.getString("topic", "");
            if (legacy != null && legacy.trim().length() > 0) {
                devices.add(new Device(legacy.trim(), legacy.trim(), ""));
            }
        }
        active = prefs.getInt("active", devices.isEmpty() ? -1 : 0);
        if (active < 0 || active >= devices.size()) {
            active = devices.isEmpty() ? -1 : 0;
        }
    }

    public void save() {
        StringBuilder sb = new StringBuilder();
        for (Device d : devices) {
            sb.append(clean(d.name)).append(FS).append(clean(d.topic))
                    .append(FS).append(clean(d.note)).append(RS);
        }
        prefs.edit()
                .putString("devices", sb.toString())
                .putInt("active", active)
                .putString("host", host)
                .putInt("port", port)
                .putString("user", user)
                .putString("pass", pass)
                .putBoolean("reconnect", autoReconnect)
                .putBoolean("auto", autoRefresh)
                .putInt("poll", pollSec)
                .putInt("sec", pointSec)
                .apply();
    }

    private static String clean(String s) {
        if (s == null) {
            return "";
        }
        return s.replace(FS, ' ').replace(RS, ' ').replace('\n', ' ').replace('\r', ' ');
    }

    // ---------- 连接 ----------
    public void connect() {
        wantConnected = true;
        reconnectDelay = 5;
        if (connected || connecting) {
            return;
        }
        doConnect();
    }

    public void autoConnectIfConfigured() {
        if (configured() && !connected && !connecting) {
            connect();
        }
    }

    public void disconnect() {
        wantConnected = false;
        ui.removeCallbacks(reconnectTick);
        ui.removeCallbacks(pollTick);
        Mqtt client = mqtt;
        mqtt = null;
        if (client != null) {
            client.disconnect();
        }
        connected = false;
        connecting = false;
        addLog("· 已断开连接");
        fireState();
    }

    private void doConnect() {
        if (connecting || connected) {
            return;
        }
        final String topicNow = activeTopic();
        if (topicNow.trim().length() == 0) {
            addLog("! 还没有选择设备");
            return;
        }
        connecting = true;
        lastError = "";
        fireState();
        addLog("· 正在连接 " + host + ":" + port + "（主题 " + topicNow + "）");

        final String clientId = "relayapp" + Integer.toHexString((int) (System.nanoTime() & 0xFFFFFF));
        final Mqtt.Listener listener = new Mqtt.Listener() {
            @Override
            public void onConnected() {
                connected = true;
                connecting = false;
                reconnectDelay = 5;
                addLog("· 已连接服务器，正在订阅");
                startPoll();
                fireState();
                final Mqtt client = mqtt;
                if (client != null) {
                    io.execute(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                client.subscribe(topicNow);
                            } catch (Exception e) {
                                addLog("! 订阅失败：" + msg(e));
                            }
                        }
                    });
                }
            }

            @Override
            public void onSubscribed() {
                addLog("· 订阅成功");
                fireState();
                publish("id", false);
            }

            @Override
            public void onMessage(String t, String payload) {
                handleMessage(t, payload);
            }

            @Override
            public void onClosed(String reason) {
                boolean wasConnected = connected;
                connected = false;
                connecting = false;
                ui.removeCallbacks(pollTick);
                lastError = reason;
                if (wasConnected) {
                    addLog("· 连接断开：" + reason);
                }
                fireState();
                if (wantConnected && autoReconnect) {
                    ui.removeCallbacks(reconnectTick);
                    ui.postDelayed(reconnectTick, reconnectDelay * 1000L);
                    reconnectDelay = Math.min(30, reconnectDelay + 5);
                }
            }

            @Override
            public void onError(String message) {
                lastError = message;
                addLog("! " + message);
            }
        };

        final Mqtt client = new Mqtt(host, port, clientId, user, pass, 60, listener);
        mqtt = client;
        io.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    client.connect();
                } catch (Exception e) {
                    connecting = false;
                    connected = false;
                    lastError = msg(e);
                    addLog("! 连接失败：" + lastError);
                    fireState();
                    if (wantConnected && autoReconnect) {
                        ui.removeCallbacks(reconnectTick);
                        ui.postDelayed(reconnectTick, reconnectDelay * 1000L);
                        reconnectDelay = Math.min(30, reconnectDelay + 5);
                    }
                }
            }
        });
    }

    private void startPoll() {
        ui.removeCallbacks(pollTick);
        ui.postDelayed(pollTick, Math.max(3, pollSec) * 1000L);
    }

    // ---------- 发指令 ----------
    public void publish(final String cmd, final boolean logIt) {
        final Mqtt client = mqtt;
        if (!connected || client == null) {
            if (logIt) {
                addLog("! 未连接，指令没发出去：" + cmd);
            }
            return;
        }
        final String topicNow = activeTopic();
        if (topicNow.length() == 0) {
            return;
        }
        rememberSend(cmd);
        if (logIt) {
            addLog("→ " + cmd);
        }
        io.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    client.publish(topicNow, cmd);
                } catch (Exception e) {
                    addLog("! 发送失败：" + msg(e));
                }
            }
        });
        if (logIt && !"qc".equals(cmd) && !"q1".equals(cmd) && !"id".equals(cmd)) {
            ui.postDelayed(new Runnable() {
                @Override
                public void run() {
                    publish("q1", false);
                }
            }, 400);
        }
    }

    private void rememberSend(String payload) {
        synchronized (recentSends) {
            recentSends.addLast(new String[]{payload, String.valueOf(System.currentTimeMillis())});
            while (recentSends.size() > 24) {
                recentSends.removeFirst();
            }
        }
    }

    private boolean isSelfEcho(String payload) {
        long now = System.currentTimeMillis();
        synchronized (recentSends) {
            for (int i = 0; i < recentSends.size(); i++) {
                String[] e = recentSends.get(i);
                if (e[0].equals(payload)) {
                    long ts = 0L;
                    try {
                        ts = Long.parseLong(e[1]);
                    } catch (NumberFormatException ignored) {
                    }
                    if (now - ts < 6000) {
                        recentSends.remove(i);
                        return true;
                    }
                }
            }
        }
        return false;
    }

    private void handleMessage(String topic, String payload) {
        if (payload == null || payload.length() == 0) {
            return;
        }
        if (isSelfEcho(payload)) {
            return;
        }
        // 搜索设备期间，别的主题发来的设备回包只当候选，不污染当前设备状态
        if (discovering && topic != null && !topic.equals(activeTopic())) {
            if (looksLikeDeviceReply(payload)) {
                synchronized (discovered) {
                    discovered.put(topic, payload);
                }
            }
            return;
        }
        addLog("← " + payload);

        Protocol p = Protocol.parse(payload);
        boolean changed = false;
        if (p.relay1 != null) {
            relay1 = p.relay1;
            lastUpdate = System.currentTimeMillis();
            changed = true;
        }
        if (p.signal != null) {
            signal = p.signal;
            lastUpdate = System.currentTimeMillis();
            changed = true;
        }
        if (p.devid != null && p.devid.length() > 0) {
            devid = p.devid;
            changed = true;
        }
        if (p.version != null) {
            version = p.version;
            changed = true;
        }
        if (p.ssid != null) {
            ssid = p.ssid;
            changed = true;
        }
        if (p.ip != null) {
            ip = p.ip;
            changed = true;
        }
        if (p.ddjy != null) {
            ddjyText = p.ddjy == 0 ? "上电全关" : p.ddjy == 1 ? "上电全开" : "断电记忆";
            changed = true;
        }
        if (p.panelLocked != null) {
            panelText = p.panelLocked ? "已锁定" : "未锁定";
            changed = true;
        }
        if (p.ack != null) {
            addLog("· " + p.ack + "  " + Protocol.ackText(p.ack));
        }
        if (changed) {
            fireState();
        }
    }

    // ---------- 自动搜索同一服务器上的设备 ----------
    public boolean isDiscovering() {
        return discovering;
    }

    /**
     * 尽力而为的自动发现：临时订阅 "#"，把"看起来像本固件回包"的主题记下来。
     *
     * 局限：固件只在收到指令时才往自己的主题发消息，不会主动广播，
     * 所以这里只能发现"正在通信"的设备（例如你刚在另一台设备上点过按钮），
     * 或者同一个公共服务器上恰好也在用这套固件、并且在发消息的设备。
     */
    public void discoverDevices(final int seconds, final DiscoverCallback cb) {
        if (!connected) {
            addLog("! 还没连上服务器，先连接再搜索");
            ui.post(new Runnable() {
                @Override
                public void run() {
                    if (cb != null) {
                        cb.onDone(new ArrayList<Device>());
                    }
                }
            });
            return;
        }
        synchronized (discovered) {
            discovered.clear();
        }
        discovering = true;
        addLog("· 开始搜索设备（" + seconds + " 秒），只发不回的设备搜不到");
        final Mqtt client = mqtt;
        if (client != null) {
            io.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        client.subscribe("#");
                    } catch (Exception e) {
                        addLog("! 订阅通配符失败：" + msg(e));
                    }
                }
            });
        }
        ui.postDelayed(new Runnable() {
            @Override
            public void run() {
                finishDiscovery(cb);
            }
        }, Math.max(3, seconds) * 1000L);
    }

    private void finishDiscovery(DiscoverCallback cb) {
        discovering = false;
        final Mqtt client = mqtt;
        if (client != null) {
            io.execute(new Runnable() {
                @Override
                public void run() {
                    try {
                        client.unsubscribe("#");
                    } catch (Exception ignored) {
                    }
                }
            });
        }
        ArrayList<Device> found = new ArrayList<Device>();
        synchronized (discovered) {
            for (String topic : discovered.keySet()) {
                found.add(new Device(topic, topic, "自动发现"));
            }
        }
        addLog("· 搜索结束，发现 " + found.size() + " 个主题");
        if (cb != null) {
            cb.onDone(found);
        }
    }

    private boolean looksLikeDeviceReply(String payload) {
        String p = payload.trim();
        if (p.length() == 0 || p.length() > 200) {
            return false;
        }
        Protocol info = Protocol.parse(p);
        if (info.relay1 != null || info.version != null || info.ack != null
                || info.signal != null || info.devid != null) {
            return true;
        }
        return p.startsWith("s!-") || p.startsWith("zt");
    }

    // ---------- 工具 ----------
    public static String msg(Throwable t) {
        if (t == null) {
            return "未知错误";
        }
        String m = t.getMessage();
        return m == null ? t.getClass().getSimpleName() : m;
    }

    public static String time(long ts) {
        return new SimpleDateFormat("HH:mm:ss", Locale.US).format(new Date(ts));
    }

    public static String now() {
        return time(System.currentTimeMillis());
    }

    public static void saveCrash(Context ctx, Throwable t) {
        try {
            StringWriter sw = new StringWriter();
            t.printStackTrace(new PrintWriter(sw));
            String s = sw.toString();
            if (s.length() > 7000) {
                s = s.substring(0, 7000);
            }
            String when = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US).format(new Date());
            String env = "设备 " + android.os.Build.MANUFACTURER + " " + android.os.Build.MODEL
                    + " / Android " + android.os.Build.VERSION.RELEASE
                    + " (API " + android.os.Build.VERSION.SDK_INT + ") / APP " + APP_VER;
            String boot = "";
            try {
                boot = ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE).getString("boot_trace", "");
            } catch (Throwable ignored) {
            }
            ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE).edit()
                    .putString("last_crash", when + "\n" + env + "\n\n【启动进度】\n" + boot + "\n【异常堆栈】\n" + s)
                    .apply();
        } catch (Throwable ignored) {
        }
    }

    public static void mark(Context ctx, String step) {
        try {
            SharedPreferences sp = ctx.getSharedPreferences(PREF, Context.MODE_PRIVATE);
            String old = sp.getString("boot_trace", "");
            String s = (old == null ? "" : old) + now() + "  " + step + "\n";
            if (s.length() > 1200) {
                s = s.substring(s.length() - 1200);
            }
            sp.edit().putString("boot_trace", s).commit();
        } catch (Throwable ignored) {
        }
    }

    public String lastCrash() {
        try {
            String s = prefs.getString("last_crash", "");
            return s == null ? "" : s;
        } catch (Throwable t) {
            return "";
        }
    }

    public void clearCrash() {
        prefs.edit().remove("last_crash").apply();
    }
}
