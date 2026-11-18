package com.relay.one;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 设备返回解析（纯 Java，无 Android 依赖，可在桌面 JVM 上单测）。
 *
 * 支持：
 *   n1 / f1                  单路状态
 *   s!-55,n1                 信号强度 + 状态
 *   ztn1f2                   组合状态
 *   qkok/qgok/sdok/ksok...   固定回执
 *   bbh_2.63                 固件版本
 *   SSID:mywifi,192.168.1.100
 *   8c4f0052013a             设备 ID
 *   ddjy==2 / appz==1        配置查询
 *   {"information":"n1","id":"..."}   JSON 模式
 */
public final class Protocol {

    public Boolean relay1;      // 第 1 路：true 导通 / false 断开 / null 未知
    public Integer signal;      // WiFi 信号强度（dBm，负数）
    public String version;      // 固件版本，如 2.63
    public String devid;        // 设备 ID
    public String ssid;         // WiFi 名称
    public String ip;           // 设备 IP
    public String ack;          // 固定回执原文
    public Integer ddjy;        // 上电模式 0/1/2
    public Integer appz;        // 自动配网 0/1
    public Boolean panelLocked; // 面板锁
    public String payload = ""; // 实际用于解析的内容（JSON 已解包）

    private static final Pattern P_SIGNAL = Pattern.compile("s!-(-?\\d+)");
    private static final Pattern P_VERSION = Pattern.compile("bbh[_-]?([0-9]+(?:\\.[0-9]+)+)");
    private static final Pattern P_DDJY = Pattern.compile("ddjy=+([012])");
    private static final Pattern P_APPZ = Pattern.compile("appz=+([01])");
    private static final Pattern P_SSID = Pattern.compile("SSID:\\s*([^,]+),\\s*([0-9]{1,3}(?:\\.[0-9]{1,3}){3})");
    private static final Pattern P_TOKENS = Pattern.compile("[nf]\\d+");
    private static final Pattern P_TOKENLIST = Pattern.compile("[nf]\\d+((,)?[nf]\\d+)*");
    private static final Pattern P_HEXID = Pattern.compile("[0-9a-fA-F]{10,16}");
    private static final Pattern P_JSON_INFO = Pattern.compile("\"information\"\\s*:\\s*\"([^\"]*)\"");
    private static final Pattern P_JSON_ID = Pattern.compile("\"id\"\\s*:\\s*\"([^\"]*)\"");

    public static Protocol parse(String text) {
        Protocol p = new Protocol();
        String t = text == null ? "" : text.trim();
        if (t.isEmpty()) {
            return p;
        }

        // JSON 模式：{"information":"n1","id":"8c4f0052013a"}
        if (t.startsWith("{")) {
            Matcher mi = P_JSON_INFO.matcher(t);
            if (mi.find()) {
                t = mi.group(1).trim();
            }
            Matcher mId = P_JSON_ID.matcher(t);
            if (mId.find()) {
                p.devid = mId.group(1).trim();
            }
            if (p.devid == null) {
                Matcher mId2 = P_JSON_ID.matcher(text);
                if (mId2.find()) {
                    p.devid = mId2.group(1).trim();
                }
            }
        }
        p.payload = t;

        Matcher ms = P_SIGNAL.matcher(t);
        if (ms.find()) {
            try {
                p.signal = -Math.abs(Integer.parseInt(ms.group(1)));
            } catch (NumberFormatException ignored) {
            }
        }

        // 继电器状态：去掉信号/zt 前缀后整句严格匹配，避免把设备 ID 里的字符当状态
        String body = t.replaceFirst("^s!-(-?\\d+)", "");
        if (body.startsWith("zt")) {
            body = body.substring(2);
        }
        body = body.replace(" ", "");
        while (body.startsWith(",")) {
            body = body.substring(1);
        }
        if (!body.isEmpty() && P_TOKENLIST.matcher(body).matches()) {
            Matcher mt = P_TOKENS.matcher(body);
            while (mt.find()) {
                String tok = mt.group();
                try {
                    int idx = Integer.parseInt(tok.substring(1));
                    if (idx == 1) {
                        p.relay1 = tok.charAt(0) == 'n'; // 粘连时以后出现的为准
                    }
                } catch (NumberFormatException ignored) {
                }
            }
        }

        Matcher mv = P_VERSION.matcher(t);
        if (mv.find()) {
            p.version = mv.group(1);
        }

        Matcher md = P_DDJY.matcher(t);
        if (md.find()) {
            p.ddjy = Integer.valueOf(md.group(1));
        }

        if (t.contains("sdok")) {
            p.panelLocked = Boolean.TRUE;
        } else if (t.contains("ksok")) {
            p.panelLocked = Boolean.FALSE;
        }

        Matcher ma = P_APPZ.matcher(t);
        if (ma.find()) {
            p.appz = Integer.valueOf(ma.group(1));
        }

        Matcher mss = P_SSID.matcher(t);
        if (mss.find()) {
            p.ssid = mss.group(1).trim();
            p.ip = mss.group(2).trim();
        }

        String[] acks = {"qkok", "qgok", "sdok", "ksok", "rest_ok", "appz_ok", "ddjy-ok", "ddjy_ok"};
        for (String a : acks) {
            if (t.contains(a)) {
                p.ack = a;
                break;
            }
        }

        if (p.devid == null && P_HEXID.matcher(t).matches()) {
            p.devid = t.toLowerCase();
        }
        return p;
    }

    /** 回执的中文说明，非回执返回 null。 */
    public static String ackText(String ack) {
        if (ack == null) {
            return null;
        }
        if ("qkok".equals(ack)) return "全部导通成功";
        if ("qgok".equals(ack)) return "全部断开成功";
        if ("sdok".equals(ack)) return "面板已锁定";
        if ("ksok".equals(ack)) return "面板已解锁";
        if ("rest_ok".equals(ack)) return "设备重启中";
        if ("appz_ok".equals(ack)) return "自动配网设置成功";
        if (ack.startsWith("ddjy")) return "上电模式设置成功";
        return ack;
    }
}
