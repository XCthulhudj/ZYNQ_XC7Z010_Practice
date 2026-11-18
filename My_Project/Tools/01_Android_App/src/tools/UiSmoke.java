package harness;

import android.app.Activity;
import android.os.Handler;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.relay.one.MainActivity;
import com.relay.one.SettingsActivity;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * 桌面冒烟测试：在 JVM 上真跑两个界面的生命周期、按钮点击，并可选真连 broker 验证链路。
 *
 * 用法： java -cp "<classes>" harness.UiSmoke [--live <topic>]
 */
public final class UiSmoke {

    private static int fails = 0;

    public static void main(String[] args) throws Exception {
        boolean live = args.length >= 2 && "--live".equals(args[0]);
        String topic = live ? args[1] : null;

        smoke(new MainActivity(), "主界面");
        smoke(new SettingsActivity(), "设置界面");
        deviceListTest();

        if (live) {
            liveTest(topic);
        }

        System.out.println("FAILS: " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }

    /** 多设备 + 备注：增删改、切换、序列化往返。 */
    private static void deviceListTest() {
        System.out.println("=== 设备列表（多设备 + 备注）===");
        com.relay.one.RelayManager m = com.relay.one.RelayManager.get(new android.content.Context());
        try {
            while (!m.devices.isEmpty()) {
                m.removeDevice(0);
            }
            // 指向一个必定连不上的本地端口，避免测试时产生真实连接
            m.host = "127.0.0.1";
            m.port = 9;
            m.autoReconnect = false;

            m.addDevice("客厅灯", "aaa111aaa111", "一楼客厅吸顶灯");
            m.addDevice("水泵", "bbb222bbb222", "院子增压泵");
            check(m.devices.size() == 2, "添加两台设备");
            check("一楼客厅吸顶灯".equals(m.devices.get(0).note), "第一台的备注正确");
            check(m.activeIndex() == 1, "添加后自动选中新设备");
            check("bbb222bbb222".equals(m.activeTopic()), "当前主题是新设备");

            m.save();
            m.devices.clear();
            m.load();
            check(m.devices.size() == 2, "存盘再读取，设备还在（序列化往返）");
            check("院子增压泵".equals(m.devices.get(1).note), "备注也存住了");
            check("aaa111aaa111".equals(m.devices.get(0).topic), "设备 ID 存住了");

            m.selectDevice(0);
            check(m.activeIndex() == 0, "切换到第一台");
            check(m.relay1 == null, "切换后状态清空，重新读取");

            m.updateDevice(0, "客厅主灯", "玄关灯带");
            check("客厅主灯".equals(m.devices.get(0).label()), "改名生效");
            check("玄关灯带".equals(m.devices.get(0).note), "改备注生效");

            String sub = m.devices.get(0).subtitle();
            check("玄关灯带".equals(sub), "副标题优先显示备注");

            m.removeDevice(1);
            check(m.devices.size() == 1, "删除设备");
            check(m.activeIndex() == 0, "删除后当前设备仍然有效");

            android.os.Handler.drain(6);
            System.out.println("PASS 设备列表流程无异常");
        } catch (Throwable t) {
            System.out.println("FAIL 设备列表测试异常: " + root(t));
            root(t).printStackTrace(System.out);
            fails++;
        }
    }

    private static void smoke(Activity act, String name) {
        System.out.println("=== " + name + " ===");
        try {
            call(act, "onCreate", new Class<?>[]{android.os.Bundle.class}, new Object[]{null});
            call(act, "onResume", new Class<?>[]{}, new Object[]{});
            System.out.println("PASS onCreate/onResume 正常返回");
        } catch (Throwable t) {
            Throwable r = root(t);
            System.out.println("FAIL " + name + " 创建失败: " + r);
            r.printStackTrace(System.out);
            fails++;
            return;
        }

        View content = act.getContentView();
        if (content == null) {
            System.out.println("FAIL " + name + " 没有内容视图");
            fails++;
            return;
        }

        List<View> all = new ArrayList<View>();
        collect(content, all);
        int buttons = 0;
        for (View v : all) {
            if (v instanceof Button) {
                buttons++;
            }
        }
        System.out.println("视图树: " + all.size() + " 个节点，按钮 " + buttons + " 个");
        if (all.size() < 30) {
            System.out.println("FAIL 界面节点太少，可能没搭起来");
            fails++;
        }

        int clicked = 0;
        int skipped = 0;
        for (View v : all) {
            if (!(v instanceof Button)) {
                continue;
            }
            Button b = (Button) v;
            String label = b.getText() == null ? "?" : b.getText().toString();
            if (label.contains("清空") || label.contains("清除") || label.contains("重启")
                    || label.contains("返回") || label.contains("帮助")) {
                skipped++;
                continue;
            }
            try {
                if (b.performClick()) {
                    clicked++;
                }
            } catch (Throwable t) {
                System.out.println("FAIL 点击「" + label + "」抛异常: " + root(t));
                fails++;
            }
        }
        System.out.println("PASS 点击 " + clicked + " 个按钮（跳过 " + skipped + " 个会破坏现场的），均无异常");

        try {
            Handler.drain(8);
            System.out.println("PASS 执行排队任务（自动刷新/重连）无异常");
        } catch (Throwable t) {
            System.out.println("FAIL 排队任务异常: " + root(t));
            fails++;
        }

        try {
            call(act, "onPause", new Class<?>[]{}, new Object[]{});
            call(act, "onDestroy", new Class<?>[]{}, new Object[]{});
            System.out.println("PASS onPause/onDestroy 正常返回");
        } catch (Throwable t) {
            System.out.println("FAIL 生命周期异常: " + root(t));
            fails++;
        }
    }

    private static void liveTest(String topic) throws Exception {
        System.out.println("=== 联调：真连 broker.emqx.io:1883，主题 " + topic + " ===");
        SettingsActivity act = new SettingsActivity();
        call(act, "onCreate", new Class<?>[]{android.os.Bundle.class}, new Object[]{null});
        call(act, "onResume", new Class<?>[]{}, new Object[]{});

        // 现在的连接入口是「添加设备后自动连」，直接把设备和服务器配好
        com.relay.one.RelayManager m = com.relay.one.RelayManager.get(new android.content.Context());
        m.host = "broker.emqx.io";
        m.port = 1883;
        m.user = "";
        m.pass = "";
        m.autoReconnect = true;
        m.addDevice("联调设备", topic, "冒烟测试");
        System.out.println("PASS 已添加设备并触发连接，等待回调…");

        long deadline = System.currentTimeMillis() + 25000;
        boolean online = false;
        while (System.currentTimeMillis() < deadline) {
            try {
                Handler.drain(30);
            } catch (Throwable t) {
                System.out.println("FAIL 回调抛异常: " + root(t));
                root(t).printStackTrace(System.out);
                fails++;
                break;
            }
            if (m.connected && containsText(act.getContentView(), "在线")) {
                online = true;
                break;
            }
            Thread.sleep(200);
        }
        check(m.connected, "MQTT 连接成功");
        check(online, "设置界面显示「在线」");

        // 再开一个主界面，确认普通用户视角也能看到在线状态
        MainActivity main = new MainActivity();
        call(main, "onCreate", new Class<?>[]{android.os.Bundle.class}, new Object[]{null});
        boolean mainOnline = containsText(main.getContentView(), "在线");
        check(mainOnline, "主界面显示「在线」");
        boolean stateShown = containsText(main.getContentView(), "已断开")
                || containsText(main.getContentView(), "已导通")
                || containsText(main.getContentView(), "未知");
        check(stateShown, "主界面显示了继电器状态");
        check(containsText(main.getContentView(), "联调设备"), "主界面显示了设备名称");

        m.disconnect();
        call(main, "onDestroy", new Class<?>[]{}, new Object[]{});
        call(act, "onDestroy", new Class<?>[]{}, new Object[]{});
    }

    private static void check(boolean ok, String what) {
        System.out.println((ok ? "PASS " : "FAIL ") + what);
        if (!ok) {
            fails++;
        }
    }

    private static boolean containsText(View v, String needle) {
        if (v instanceof TextView) {
            CharSequence cs = ((TextView) v).getText();
            if (cs != null && cs.toString().contains(needle)) {
                return true;
            }
        }
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                if (containsText(g.getChildAt(i), needle)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static EditText findEdit(List<View> all, String hintPart) {
        for (View v : all) {
            if (v instanceof EditText) {
                EditText e = (EditText) v;
                String h = e.getHint() == null ? "" : e.getHint().toString();
                if (h.contains(hintPart)) {
                    return e;
                }
            }
        }
        return null;
    }

    private static Button findButton(List<View> all, String label) {
        for (View v : all) {
            if (v instanceof Button) {
                Button b = (Button) v;
                String t = b.getText() == null ? "" : b.getText().toString();
                if (t.trim().equals(label)) {
                    return b;
                }
            }
        }
        return null;
    }

    private static Throwable root(Throwable t) {
        Throwable cur = t;
        while (cur.getCause() != null && cur.getCause() != cur) {
            cur = cur.getCause();
        }
        return cur;
    }

    private static Object call(Object target, String name, Class<?>[] types, Object[] args) throws Exception {
        Class<?> c = target.getClass();
        while (c != null) {
            try {
                Method m = c.getDeclaredMethod(name, types);
                m.setAccessible(true);
                return m.invoke(target, args);
            } catch (NoSuchMethodException e) {
                c = c.getSuperclass();
            }
        }
        throw new NoSuchMethodException(name);
    }

    private static void collect(View v, List<View> out) {
        out.add(v);
        if (v instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) v;
            for (int i = 0; i < g.getChildCount(); i++) {
                collect(g.getChildAt(i), out);
            }
        }
    }
}
