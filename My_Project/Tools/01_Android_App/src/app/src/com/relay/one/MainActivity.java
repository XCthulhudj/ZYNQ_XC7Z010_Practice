package com.relay.one;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * 主界面（面向普通用户）：
 *   第一行是设备列表，点一下就切换；「＋」添加新设备（名字 + 设备 ID）。
 *   下面是当前设备的开关、点动、信息。
 */
public class MainActivity extends Activity implements RelayManager.Listener {

    private RelayManager m;

    private TextView tvDeviceName;
    private TextView tvOnline;
    private View dotOnline;
    private TextView tvState;
    private TextView tvSub;
    private Button btnToggle;
    private EditText etSec;
    private TextView tvDevid;
    private TextView tvVersion;
    private TextView tvSsid;
    private TextView tvIp;
    private TextView tvDdjy;
    private TextView tvPanel;
    private LinearLayout heroCard;
    private LinearLayout setupCard;
    private LinearLayout chipRow;
    private LinearLayout quickCard;
    private LinearLayout infoCard;
    private TextView tvTip;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        RelayManager.mark(this, "主界面 onCreate");
        try {
            m = RelayManager.get(getApplicationContext());
            getWindow().setStatusBarColor(Ui.BLUE_DARK);
            getWindow().setNavigationBarColor(0xFFFFFFFF);
            setContentView(buildUi());
            m.addListener(this);
            render();
            m.autoConnectIfConfigured();
            RelayManager.mark(this, "主界面 已渲染");
        } catch (Throwable t) {
            RelayManager.saveCrash(this, t);
            setContentView(fatalView(t));
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (m != null) {
            m.addListener(this);
            render();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (m != null) {
            m.removeListener(this);
        }
    }

    // ---------------- 界面 ----------------
    private ScrollView buildUi() {
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(Ui.BG);
        scroll.setFillViewport(true);

        LinearLayout root = Ui.vertical(this);
        scroll.addView(root);
        root.addView(buildHeader());
        root.addView(buildDeviceBar());
        root.addView(Ui.spacer(this, 6));

        heroCard = buildHeroCard();
        root.addView(heroCard);

        setupCard = buildSetupCard();
        root.addView(setupCard);

        quickCard = buildQuickCard();
        root.addView(quickCard);

        infoCard = buildInfoCard();
        root.addView(infoCard);

        root.addView(buildFooter());
        return scroll;
    }

    private LinearLayout buildHeader() {
        LinearLayout header = Ui.vertical(this);
        header.setBackground(Ui.gradient(this, Ui.HEADER_TOP, Ui.HEADER_BOTTOM));
        int p = Ui.dp(this, 20);
        header.setPadding(p, Ui.dp(this, 26), p, Ui.dp(this, 20));

        LinearLayout top = Ui.row(this);
        LinearLayout titles = Ui.vertical(this);
        titles.addView(Ui.text(this, "远程开关MQTT", 20f, 0xFFFFFFFF, true));
        tvDeviceName = Ui.text(this, "还没有设备", 12f, 0xCCFFFFFF, false);
        titles.addView(tvDeviceName);
        top.addView(titles, Ui.weight(1f));

        LinearLayout pill = Ui.row(this);
        pill.setBackground(Ui.round(this, 0x33FFFFFF, 20f));
        pill.setPadding(Ui.dp(this, 10), Ui.dp(this, 6), Ui.dp(this, 12), Ui.dp(this, 6));
        dotOnline = Ui.dot(this, 0xFFE2E8F0);
        pill.addView(dotOnline);
        tvOnline = Ui.text(this, "未连接", 12f, 0xFFFFFFFF, true);
        pill.addView(tvOnline);
        top.addView(pill);

        header.addView(top);
        return header;
    }

    /** 设备切换条：每台设备一个胶囊，右边是「＋ 添加」。 */
    private LinearLayout buildDeviceBar() {
        HorizontalScrollView hsv = new HorizontalScrollView(this);
        hsv.setBackgroundColor(Ui.BG);
        hsv.setHorizontalScrollBarEnabled(false);

        chipRow = Ui.row(this);
        int p = Ui.dp(this, 12);
        chipRow.setPadding(p, Ui.dp(this, 10), p, Ui.dp(this, 2));
        hsv.addView(chipRow);
        return wrapBar(hsv);
    }

    private LinearLayout wrapBar(View inner) {
        LinearLayout box = Ui.vertical(this);
        box.addView(inner);
        return box;
    }

    private LinearLayout buildHeroCard() {
        LinearLayout card = Ui.card(this);

        tvState = Ui.text(this, "未知", 34f, Ui.TEXT_FAINT, true);
        card.addView(tvState);

        tvSub = Ui.text(this, "正在读取设备状态…", 12f, Ui.TEXT_DIM, false);
        tvSub.setPadding(0, Ui.dp(this, 4), 0, Ui.dp(this, 14));
        card.addView(tvSub);

        btnToggle = Ui.primary(this, "打 开", Ui.GREEN);
        btnToggle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean on = m.relay1 != null && m.relay1;
                m.publish(on ? "b1" : "a1", true);
            }
        });
        card.addView(btnToggle);

        tvTip = Ui.text(this, "点一下切换这一路的通断", 11f, Ui.TEXT_FAINT, false);
        tvTip.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
        tvTip.setPadding(0, Ui.dp(this, 10), 0, 0);
        card.addView(tvTip);
        return card;
    }

    private LinearLayout buildSetupCard() {
        LinearLayout card = Ui.card(this);
        card.addView(Ui.text(this, "先添加一台设备", 17f, Ui.TEXT, true));
        TextView desc = Ui.text(this,
                "点下面的按钮，填设备名字和设备 ID（就是配置工具里看到的主题），以后主界面直接点着切换。",
                13f, Ui.TEXT_DIM, false);
        desc.setPadding(0, Ui.dp(this, 6), 0, Ui.dp(this, 14));
        card.addView(desc);

        Button add = Ui.primary(this, "＋ 添加设备", Ui.BLUE);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeviceDialogs.add(MainActivity.this, m);
            }
        });
        card.addView(add);
        return card;
    }

    private LinearLayout buildQuickCard() {
        LinearLayout card = Ui.card(this);
        card.addView(Ui.text(this, "快捷操作", 13f, Ui.TEXT_DIM, true));

        LinearLayout r1 = Ui.row(this);
        r1.setPadding(0, Ui.dp(this, 8), 0, 0);
        Button p1 = Ui.chip(this, "点动 1 秒");
        p1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.publish("c1", true);
            }
        });
        r1.addView(p1, Ui.weight(1f));
        Button p2 = Ui.chip(this, "点动 0.6 秒");
        p2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.publish("c1s", true);
            }
        });
        r1.addView(p2, Ui.weight(1f));
        card.addView(r1);

        LinearLayout r2 = Ui.row(this);
        r2.setPadding(0, Ui.dp(this, 4), 0, 0);
        r2.addView(Ui.text(this, "点动", 13f, Ui.TEXT_DIM, false));

        etSec = new EditText(this);
        etSec.setInputType(InputType.TYPE_CLASS_NUMBER);
        etSec.setTextSize(15f);
        etSec.setTextColor(Ui.TEXT);
        etSec.setGravity(android.view.Gravity.CENTER);
        etSec.setSingleLine(true);
        etSec.setBackground(Ui.roundStroke(this, Ui.SOFT, Ui.BORDER, 12f));
        etSec.setPadding(Ui.dp(this, 10), Ui.dp(this, 8), Ui.dp(this, 10), Ui.dp(this, 8));
        LinearLayout.LayoutParams secLp = new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 0.8f);
        secLp.setMargins(Ui.dp(this, 8), 0, Ui.dp(this, 8), 0);
        r2.addView(etSec, secLp);
        r2.addView(Ui.text(this, "秒", 13f, Ui.TEXT_DIM, false));

        Button go = Ui.chip(this, "执行");
        go.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                int sec = parsePositive(etSec.getText().toString(), 10);
                sec = Math.max(1, Math.min(60, sec));
                etSec.setText(String.valueOf(sec));
                m.pointSec = sec;
                m.save();
                m.publish("c1=" + sec, true);
            }
        });
        r2.addView(go, Ui.weight(1.1f));
        card.addView(r2);
        return card;
    }

    private LinearLayout buildInfoCard() {
        LinearLayout card = Ui.card(this);

        LinearLayout header = Ui.row(this);
        card.addView(header);
        header.addView(Ui.text(this, "设备信息", 13f, Ui.TEXT_DIM, true), Ui.weight(1f));
        Button refresh = Ui.button(this, "刷新", 0x00000000, Ui.BLUE, 13f, 12f, 36f);
        LinearLayout.LayoutParams rlp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        refresh.setLayoutParams(rlp);
        refresh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!m.connected) {
                    m.autoConnectIfConfigured();
                }
                m.publish("qc", false);
                m.publish("ssid", false);
                m.publish("bbh", false);
                m.publish("qe", false);
                m.publish("qh", false);
            }
        });
        header.addView(refresh);

        LinearLayout g1 = Ui.row(this);
        tvDevid = Ui.infoCell(this, g1, "设备 ID");
        tvVersion = Ui.infoCell(this, g1, "固件版本");
        card.addView(g1);

        LinearLayout g2 = Ui.row(this);
        tvSsid = Ui.infoCell(this, g2, "WiFi 名称");
        tvIp = Ui.infoCell(this, g2, "设备内网 IP");
        card.addView(g2);

        LinearLayout g3 = Ui.row(this);
        tvDdjy = Ui.infoCell(this, g3, "上电模式");
        tvPanel = Ui.infoCell(this, g3, "面板锁");
        card.addView(g3);
        return card;
    }

    private LinearLayout buildFooter() {
        LinearLayout box = Ui.vertical(this);
        int p = Ui.dp(this, 14);
        box.setPadding(p, Ui.dp(this, 10), p, Ui.dp(this, 26));

        Button more = Ui.button(this, "更多设置", Ui.CARD, Ui.TEXT, 15f, 16f, 52f);
        more.setBackground(Ui.roundStroke(this, Ui.CARD, Ui.BORDER, 16f));
        more.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, SettingsActivity.class));
            }
        });
        box.addView(more);

        TextView ver = Ui.text(this, RelayManager.APP_VER + " · MQTT 远程控制", 11f, Ui.TEXT_FAINT, false);
        ver.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
        ver.setPadding(0, Ui.dp(this, 12), 0, 0);
        box.addView(ver);
        return box;
    }

    /** 重建设备胶囊条。 */
    private void renderChips() {
        if (chipRow == null) {
            return;
        }
        chipRow.removeAllViews();
        int activeIdx = m.activeIndex();
        for (int i = 0; i < m.devices.size(); i++) {
            final int index = i;
            RelayManager.Device d = m.devices.get(i);
            boolean on = i == activeIdx;
            Button chip = Ui.button(this, d.label(), on ? Ui.BLUE : Ui.CARD,
                    on ? 0xFFFFFFFF : Ui.TEXT, 14f, 20f, 42f);
            chip.setBackground(on
                    ? Ui.round(this, Ui.BLUE, 20f)
                    : Ui.roundStroke(this, Ui.CARD, Ui.BORDER, 20f));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            lp.setMargins(0, 0, Ui.dp(this, 8), 0);
            chip.setLayoutParams(lp);
            chip.setMinimumWidth(Ui.dp(this, 64));
            chip.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if (index != m.activeIndex()) {
                        m.selectDevice(index);
                        renderChips();
                    }
                }
            });
            chip.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    DeviceDialogs.manage(MainActivity.this, m, index);
                    return true;
                }
            });
            chipRow.addView(chip);
        }

        Button add = Ui.button(this, "＋ 添加", Ui.SOFT, Ui.BLUE, 14f, 20f, 42f);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        add.setLayoutParams(lp);
        add.setMinimumWidth(Ui.dp(this, 64));
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeviceDialogs.add(MainActivity.this, m);
            }
        });
        chipRow.addView(add);
    }

    // ---------------- 渲染 ----------------
    private void render() {
        if (m == null || tvState == null) {
            return;
        }
        boolean configured = m.configured();
        setupCard.setVisibility(configured ? View.GONE : View.VISIBLE);
        heroCard.setVisibility(configured ? View.VISIBLE : View.GONE);
        quickCard.setVisibility(configured ? View.VISIBLE : View.GONE);
        infoCard.setVisibility(configured ? View.VISIBLE : View.GONE);

        RelayManager.Device d = m.activeDevice();
        tvDeviceName.setText(d == null ? "还没有设备"
                : (d.note != null && d.note.trim().length() > 0
                ? d.label() + " · " + d.note.trim() : d.label()));
        if (tvTip != null) {
            if (d != null && d.note != null && d.note.trim().length() > 0) {
                tvTip.setText(d.note.trim());
            } else {
                tvTip.setText("点一下切换这一路的通断 · 设备 ID " + (d == null ? "—" : d.topic));
            }
        }

        if (m.connected) {
            tvOnline.setText("在线");
            dotOnline.setBackground(Ui.circle(this, 0xFF4ADE80));
        } else if (m.connecting) {
            tvOnline.setText("连接中");
            dotOnline.setBackground(Ui.circle(this, 0xFFFBBF24));
        } else {
            tvOnline.setText("未连接");
            dotOnline.setBackground(Ui.circle(this, 0xFFE2E8F0));
        }

        if (m.relay1 == null) {
            tvState.setText("未知");
            tvState.setTextColor(Ui.TEXT_FAINT);
            btnToggle.setText("打 开");
            btnToggle.setBackground(Ui.round(this, Ui.GREEN, 16f));
        } else if (m.relay1) {
            tvState.setText("已导通");
            tvState.setTextColor(Ui.GREEN);
            btnToggle.setText("关 闭");
            btnToggle.setBackground(Ui.round(this, Ui.RED, 16f));
        } else {
            tvState.setText("已断开");
            tvState.setTextColor(Ui.TEXT);
            btnToggle.setText("打 开");
            btnToggle.setBackground(Ui.round(this, Ui.GREEN, 16f));
        }

        StringBuilder sub = new StringBuilder();
        if (m.signal != null) {
            sub.append("信号 ").append(m.signal).append(" dBm · ").append(level(m.signal));
        } else if (m.connected) {
            sub.append("等待设备回复…");
        } else {
            sub.append(m.lastError.length() > 0 ? m.lastError : "未连接服务器");
        }
        if (m.lastUpdate > 0) {
            sub.append("　更新于 ").append(RelayManager.time(m.lastUpdate));
        }
        tvSub.setText(sub.toString());

        tvDevid.setText(m.devid.length() == 0 ? "—" : m.devid);
        tvVersion.setText(m.version.length() == 0 ? "—" : "V" + m.version);
        tvSsid.setText(m.ssid.length() == 0 ? "—" : m.ssid);
        tvIp.setText(m.ip.length() == 0 ? "—" : m.ip);
        tvDdjy.setText(m.ddjyText.length() == 0 ? "—" : m.ddjyText);
        tvPanel.setText(m.panelText.length() == 0 ? "—" : m.panelText);

        if (etSec != null && etSec.getText().length() == 0) {
            etSec.setText(String.valueOf(m.pointSec));
        }
        renderChips();
    }

    private String level(int sig) {
        if (sig >= -50) {
            return "优";
        }
        if (sig >= -60) {
            return "良";
        }
        return sig >= -70 ? "中" : "弱";
    }

    private int parsePositive(String s, int def) {
        try {
            return Integer.parseInt(s.trim());
        } catch (Exception e) {
            return def;
        }
    }

    // ---------------- 监听 ----------------
    @Override
    public void onState() {
        render();
    }

    @Override
    public void onLog(String line) {
    }

    private ScrollView fatalView(Throwable t) {
        java.io.StringWriter sw = new java.io.StringWriter();
        t.printStackTrace(new java.io.PrintWriter(sw));
        TextView tv = Ui.text(this, "启动出错（" + RelayManager.APP_VER + "）：\n\n" + sw.toString(),
                11f, Ui.RED, false);
        tv.setTextIsSelectable(true);
        int p = Ui.dp(this, 14);
        tv.setPadding(p, p, p, p);
        ScrollView sv = new ScrollView(this);
        sv.setBackgroundColor(0xFFFFFFFF);
        sv.addView(tv);
        return sv;
    }
}
