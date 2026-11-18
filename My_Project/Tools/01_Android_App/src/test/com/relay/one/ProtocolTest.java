package com.relay.one;

/** 协议解析桌面单测（不需要 Android 设备）：java -cp testout com.relay.one.ProtocolTest */
public final class ProtocolTest {

    private static int fails = 0;

    private static void eq(String name, Object got, Object want) {
        boolean ok;
        if (got == null || want == null) {
            ok = got == want;
        } else {
            ok = got.equals(want);
        }
        if (!ok) {
            fails++;
        }
        System.out.println((ok ? "PASS " : "FAIL ") + name + "  got=" + got + " want=" + want);
    }

    public static void main(String[] args) {
        Protocol p;

        p = Protocol.parse("n1");
        eq("n1 -> relay1", p.relay1, Boolean.TRUE);
        eq("n1 -> signal 空", p.signal, null);

        p = Protocol.parse("f1");
        eq("f1 -> relay1", p.relay1, Boolean.FALSE);

        p = Protocol.parse("s!-55,n1");
        eq("s!-55,n1 -> signal", p.signal, Integer.valueOf(-55));
        eq("s!-55,n1 -> relay1", p.relay1, Boolean.TRUE);

        p = Protocol.parse("s!-68,f1");
        eq("s!-68,f1 -> signal", p.signal, Integer.valueOf(-68));
        eq("s!-68,f1 -> relay1", p.relay1, Boolean.FALSE);

        p = Protocol.parse("ztn1");
        eq("ztn1 -> relay1", p.relay1, Boolean.TRUE);
        p = Protocol.parse("ztf1");
        eq("ztf1 -> relay1", p.relay1, Boolean.FALSE);

        p = Protocol.parse("n1f1");
        eq("粘连 n1f1 -> 以后者为准", p.relay1, Boolean.FALSE);

        p = Protocol.parse("qkok");
        eq("qkok -> ack", p.ack, "qkok");
        p = Protocol.parse("qgok");
        eq("qgok -> ack", p.ack, "qgok");
        p = Protocol.parse("rest_ok");
        eq("rest_ok -> ack", p.ack, "rest_ok");
        p = Protocol.parse("ddjy-ok");
        eq("ddjy-ok -> ack", p.ack, "ddjy-ok");

        p = Protocol.parse("sdok");
        eq("sdok -> panelLocked", p.panelLocked, Boolean.TRUE);
        p = Protocol.parse("ksok");
        eq("ksok -> panelLocked", p.panelLocked, Boolean.FALSE);

        p = Protocol.parse("bbh_2.63");
        eq("bbh_2.63 -> version", p.version, "2.63");

        p = Protocol.parse("8c4f0052013a");
        eq("设备ID 识别", p.devid, "8c4f0052013a");
        eq("设备ID 不误判继电器", p.relay1, null);

        p = Protocol.parse("f1b2c3d4e5f6");
        eq("f 开头的 hex ID 不被当状态", p.relay1, null);
        eq("f 开头 hex ID 识别为设备ID", p.devid, "f1b2c3d4e5f6");

        p = Protocol.parse("SSID:mywifi,192.168.1.100");
        eq("SSID -> ssid", p.ssid, "mywifi");
        eq("SSID -> ip", p.ip, "192.168.1.100");

        p = Protocol.parse("ddjy==2");
        eq("ddjy==2", p.ddjy, Integer.valueOf(2));
        p = Protocol.parse("appz==1");
        eq("appz==1", p.appz, Integer.valueOf(1));

        p = Protocol.parse("{\"information\":\"n1\",\"id\":\"8c4f0052013a\"}");
        eq("JSON -> relay1", p.relay1, Boolean.TRUE);
        eq("JSON -> devid", p.devid, "8c4f0052013a");

        p = Protocol.parse("");
        eq("空串 -> relay1", p.relay1, null);
        p = Protocol.parse(null);
        eq("null -> relay1", p.relay1, null);


        System.out.println("FAILS: " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
