package com.relay.one;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/**
 * 设置界面：
 *   设备（列表管理：添加/编辑名称备注/删除/切换）
 *   MQTT 服务器（地址、端口、账号、密码、连接）
 *   设备设置（上电状态、面板锁、配网、重启）
 *   开发者选项（默认折叠：日志、任意指令、崩溃记录）
 */
public class SettingsActivity extends Activity implements RelayManager.Listener {

    private RelayManager m;

    private EditText etHost;
    private EditText etPort;
    private EditText etUser;
    private EditText etPass;
    private TextView tvStatus;
    private CheckBox cbReconnect;
    private LinearLayout deviceList;
    private TextView tvCurrentDevice;

    private LinearLayout devBody;
    private TextView tvDevArrow;
    private TextView tvLog;
    private ScrollView svLog;
    private EditText etCmd;
    private TextView tvCrash;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        RelayManager.mark(this, "设置界面 onCreate");
        try {
            m = RelayManager.get(getApplicationContext());
            getWindow().setStatusBarColor(0xFFFFFFFF);
            getWindow().setNavigationBarColor(0xFFFFFFFF);
            setContentView(buildUi());
            m.addListener(this);
            fillFields();
            render();
        } catch (Throwable t) {
            RelayManager.saveCrash(this, t);
            TextView tv = Ui.text(this, "设置界面出错：\n\n" + t, 11f, Ui.RED, false);
            tv.setTextIsSelectable(true);
            ScrollView sv = new ScrollView(this);
            sv.setBackgroundColor(0xFFFFFFFF);
            sv.addView(tv);
            setContentView(sv);
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
    protected void onPause() {
        super.onPause();
        readFields(false);
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
        root.addView(buildTopBar());
        root.addView(buildDeviceCard());
        root.addView(buildServerCard());
        root.addView(buildConfigCard());
        root.addView(buildDevCard());
        root.addView(buildBottom());
        return scroll;
    }

    private LinearLayout buildTopBar() {
        LinearLayout bar = Ui.row(this);
        int p = Ui.dp(this, 14);
        bar.setPadding(p, Ui.dp(this, 16), p, Ui.dp(this, 8));

        Button back = Ui.button(this, "‹ 返回", 0x00000000, Ui.BLUE, 15f, 12f, 40f);
        LinearLayout.LayoutParams blp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        back.setLayoutParams(blp);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        bar.addView(back);

        TextView title = Ui.text(this, "设置", 18f, Ui.TEXT, true);
        title.setGravity(android.view.Gravity.CENTER);
        bar.addView(title, Ui.weight(1f));

        Button help = Ui.button(this, "帮助", 0x00000000, Ui.BLUE, 15f, 12f, 40f);
        LinearLayout.LayoutParams hlp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        help.setLayoutParams(hlp);
        help.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showHelp();
            }
        });
        bar.addView(help);
        return bar;
    }

    private LinearLayout buildDeviceCard() {
        LinearLayout card = Ui.card(this);
        card.addView(Ui.text(this, "我的设备", 15f, Ui.TEXT, true));
        TextView tip = Ui.text(this, "每台设备一个主题（=设备 ID）；点一行可以切换、改名或写备注", 12f, Ui.TEXT_FAINT, false);
        tip.setPadding(0, Ui.dp(this, 4), 0, Ui.dp(this, 10));
        card.addView(tip);

        tvCurrentDevice = Ui.text(this, "当前：—", 13f, Ui.TEXT, true);
        tvCurrentDevice.setPadding(0, 0, 0, Ui.dp(this, 8));
        card.addView(tvCurrentDevice);

        deviceList = Ui.vertical(this);
        card.addView(deviceList);

        Button add = Ui.button(this, "＋ 添加设备", Ui.BLUE, 0xFFFFFFFF, 15f, 14f, 48f);
        LinearLayout.LayoutParams alp = Ui.match();
        alp.topMargin = Ui.dp(this, 10);
        add.setLayoutParams(alp);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DeviceDialogs.add(SettingsActivity.this, m);
            }
        });
        card.addView(add);

        Button scan = Ui.button(this, "自动搜索设备（10 秒）", Ui.SOFT, Ui.TEXT, 14f, 14f, 46f);
        LinearLayout.LayoutParams slp = Ui.match();
        slp.topMargin = Ui.dp(this, 8);
        scan.setLayoutParams(slp);
        scan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startDiscovery();
            }
        });
        card.addView(scan);

        TextView scanTip = Ui.text(this,
                "只监听服务器 10 秒，能发现正在发消息的设备；固件不会主动广播，搜不到就手动添加",
                11f, Ui.TEXT_FAINT, false);
        scanTip.setPadding(0, Ui.dp(this, 6), 0, 0);
        card.addView(scanTip);
        return card;
    }

    private void startDiscovery() {
        if (!m.connected) {
            toast("先连上服务器（上面的「保存并连接」）");
            return;
        }
        toast("正在搜索，约 10 秒…");
        m.discoverDevices(10, new RelayManager.DiscoverCallback() {
            @Override
            public void onDone(java.util.List<RelayManager.Device> found) {
                showDiscovered(found);
            }
        });
    }

    private void showDiscovered(java.util.List<RelayManager.Device> found) {
        if (found == null || found.isEmpty()) {
            new AlertDialog.Builder(this)
                    .setTitle("没搜到设备")
                    .setMessage("这套固件只有在收到指令时才往自己的主题发消息，不会主动广播，"
                            + "所以搜不到很正常。\n\n直接「＋ 添加设备」填设备 ID 最稳。")
                    .setPositiveButton("知道了", null)
                    .show();
            return;
        }
        final String[] items = new String[found.size()];
        for (int i = 0; i < found.size(); i++) {
            items[i] = found.get(i).topic;
        }
        new AlertDialog.Builder(this)
                .setTitle("发现 " + items.length + " 个主题（点一个加入列表）")
                .setItems(items, new android.content.DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(android.content.DialogInterface dialog, int which) {
                        m.addDevice(items[which], items[which], "自动发现");
                        toast("已添加 " + items[which]);
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    private LinearLayout buildServerCard() {
        LinearLayout card = Ui.card(this);
        card.addView(Ui.text(this, "MQTT 服务器", 15f, Ui.TEXT, true));
        TextView tip = Ui.text(this, "所有设备共用这一个服务器；和设备里填的要一样", 12f, Ui.TEXT_FAINT, false);
        tip.setPadding(0, Ui.dp(this, 4), 0, Ui.dp(this, 12));
        card.addView(tip);

        card.addView(fieldLabel("服务器地址"));
        etHost = input("broker.emqx.io", InputType.TYPE_CLASS_TEXT);
        card.addView(etHost);

        LinearLayout rowPort = Ui.row(this);
        LinearLayout colPort = Ui.vertical(this);
        colPort.addView(fieldLabel("端口"));
        etPort = input("1883", InputType.TYPE_CLASS_NUMBER);
        colPort.addView(etPort);
        rowPort.addView(colPort, Ui.weight(1f));

        LinearLayout colUser = Ui.vertical(this);
        colUser.addView(fieldLabel("账号（可留空）"));
        etUser = input("公共服务器不用填", InputType.TYPE_CLASS_TEXT);
        colUser.addView(etUser);
        rowPort.addView(colUser, Ui.weight(1.4f));
        card.addView(rowPort);

        card.addView(fieldLabel("密码"));
        etPass = input("", InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        card.addView(etPass);

        LinearLayout actions = Ui.row(this);
        actions.setPadding(0, Ui.dp(this, 12), 0, 0);
        Button connect = Ui.button(this, "保存并连接", Ui.BLUE, 0xFFFFFFFF, 15f, 14f, 48f);
        connect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                readFields(true);
                if (!m.configured()) {
                    toast("先添加一台设备");
                    return;
                }
                m.disconnect();
                m.connect();
            }
        });
        actions.addView(connect, Ui.weight(1.3f));

        Button disconnect = Ui.button(this, "断开", Ui.SOFT, Ui.TEXT, 15f, 14f, 48f);
        disconnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.disconnect();
            }
        });
        actions.addView(disconnect, Ui.weight(1f));
        card.addView(actions);

        LinearLayout opts = Ui.row(this);
        opts.setPadding(0, Ui.dp(this, 10), 0, 0);
        cbReconnect = new CheckBox(this);
        cbReconnect.setText("断线自动重连");
        cbReconnect.setTextSize(13f);
        cbReconnect.setTextColor(Ui.TEXT_DIM);
        cbReconnect.setChecked(m.autoReconnect);
        cbReconnect.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.autoReconnect = cbReconnect.isChecked();
                m.save();
            }
        });
        opts.addView(cbReconnect, Ui.weight(1f));
        card.addView(opts);

        tvStatus = Ui.text(this, "未连接", 12f, Ui.TEXT_DIM, false);
        tvStatus.setPadding(0, Ui.dp(this, 10), 0, 0);
        card.addView(tvStatus);
        return card;
    }

    private LinearLayout buildConfigCard() {
        LinearLayout card = Ui.card(this);
        card.addView(Ui.text(this, "设备设置", 15f, Ui.TEXT, true));
        TextView tip = Ui.text(this, "对当前选中的设备立即下发，不用重启", 12f, Ui.TEXT_FAINT, false);
        tip.setPadding(0, Ui.dp(this, 4), 0, Ui.dp(this, 12));
        card.addView(tip);

        card.addView(fieldLabel("上电时继电器状态"));
        LinearLayout r1 = Ui.row(this);
        r1.addView(cmdChip("全关", "ddjy=0"), Ui.weight(1f));
        r1.addView(cmdChip("全开", "ddjy=1"), Ui.weight(1f));
        r1.addView(cmdChip("断电记忆", "ddjy=2"), Ui.weight(1f));
        card.addView(r1);

        card.addView(fieldLabel("物理按键面板"));
        LinearLayout r2 = Ui.row(this);
        r2.addView(cmdChip("锁定面板", "sd"), Ui.weight(1f));
        r2.addView(cmdChip("解锁面板", "ks"), Ui.weight(1f));
        card.addView(r2);

        card.addView(fieldLabel("配网模式"));
        LinearLayout r3 = Ui.row(this);
        r3.addView(cmdChip("开启配网", "appz=1"), Ui.weight(1f));
        r3.addView(cmdChip("关闭配网", "appz=0"), Ui.weight(1f));
        card.addView(r3);

        card.addView(Ui.divider(this));
        Button restart = Ui.button(this, "重启设备", Ui.RED_LIGHT, Ui.RED, 15f, 14f, 48f);
        restart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                confirmRestart();
            }
        });
        card.addView(restart);
        return card;
    }

    private LinearLayout buildDevCard() {
        LinearLayout card = Ui.card(this);

        LinearLayout header = Ui.row(this);
        header.addView(Ui.text(this, "开发者选项", 15f, Ui.TEXT, true), Ui.weight(1f));
        tvDevArrow = Ui.text(this, "展开 ›", 12f, Ui.TEXT_DIM, false);
        header.addView(tvDevArrow);
        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean show = devBody.getVisibility() != View.VISIBLE;
                devBody.setVisibility(show ? View.VISIBLE : View.GONE);
                tvDevArrow.setText(show ? "收起 ⌄" : "展开 ›");
                if (show) {
                    renderLog();
                    renderCrash();
                }
            }
        });
        card.addView(header);

        devBody = Ui.vertical(this);
        devBody.setVisibility(View.GONE);
        card.addView(devBody);

        devBody.addView(fieldLabel("收发日志"));
        svLog = new ScrollView(this);
        tvLog = Ui.text(this, "", 11f, 0xFFD7E3F4, false);
        tvLog.setTextIsSelectable(true);
        tvLog.setBackground(Ui.roundStroke(this, 0xFF0F172A, 0xFF0F172A, 12f));
        int p = Ui.dp(this, 10);
        tvLog.setPadding(p, p, p, p);
        svLog.addView(tvLog);
        LinearLayout.LayoutParams logLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, Ui.dp(this, 150));
        logLp.setMargins(0, 0, 0, Ui.dp(this, 8));
        devBody.addView(svLog, logLp);

        LinearLayout logActions = Ui.row(this);
        Button clear = Ui.button(this, "清空", Ui.SOFT, Ui.TEXT, 13f, 12f, 40f);
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.clearLog();
                renderLog();
            }
        });
        logActions.addView(clear, Ui.weight(1f));
        Button copyLog = Ui.button(this, "复制日志", Ui.SOFT, Ui.TEXT, 13f, 12f, 40f);
        copyLog.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                StringBuilder sb = new StringBuilder();
                for (String line : m.logSnapshot()) {
                    sb.append(line).append('\n');
                }
                copyToClipboard(sb.toString());
                toast("日志已复制");
            }
        });
        logActions.addView(copyLog, Ui.weight(1f));
        devBody.addView(logActions);

        devBody.addView(fieldLabel("发送任意指令"));
        LinearLayout cmdRow = Ui.row(this);
        etCmd = input("例如 zh=a1,b1 或 bbh", InputType.TYPE_CLASS_TEXT);
        cmdRow.addView(etCmd, Ui.weight(1f));
        Button send = Ui.button(this, "发送", Ui.BLUE, 0xFFFFFFFF, 14f, 12f, 44f);
        LinearLayout.LayoutParams slp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        send.setLayoutParams(slp);
        send.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String cmd = etCmd.getText().toString().trim();
                if (cmd.length() == 0) {
                    toast("请输入指令");
                    return;
                }
                m.publish(cmd, true);
                etCmd.setText("");
            }
        });
        cmdRow.addView(send);
        devBody.addView(cmdRow);

        tvCrash = Ui.text(this, "", 11f, Ui.RED, false);
        tvCrash.setTextIsSelectable(true);
        tvCrash.setPadding(0, Ui.dp(this, 10), 0, 0);
        devBody.addView(tvCrash);

        LinearLayout crashActions = Ui.row(this);
        Button copyCrash = Ui.button(this, "复制崩溃记录", Ui.SOFT, Ui.TEXT, 13f, 12f, 40f);
        copyCrash.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String c = m.lastCrash();
                if (c.length() == 0) {
                    toast("没有崩溃记录");
                    return;
                }
                copyToClipboard(c);
                toast("已复制");
            }
        });
        crashActions.addView(copyCrash, Ui.weight(1f));
        Button clearCrash = Ui.button(this, "清除记录", Ui.SOFT, Ui.TEXT, 13f, 12f, 40f);
        clearCrash.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.clearCrash();
                renderCrash();
                toast("已清除");
            }
        });
        crashActions.addView(clearCrash, Ui.weight(1f));
        devBody.addView(crashActions);

        devBody.addView(Ui.text(this,
                "版本 " + RelayManager.APP_VER + " · 固件协议 V2.63 · 无第三方依赖",
                11f, Ui.TEXT_FAINT, false));
        return card;
    }

    private LinearLayout buildBottom() {
        LinearLayout box = Ui.vertical(this);
        int p = Ui.dp(this, 14);
        box.setPadding(p, Ui.dp(this, 4), p, Ui.dp(this, 26));
        TextView t = Ui.text(this,
                "公共测试服务器（broker.emqx.io）没有密码，知道主题的人都能控制；正式使用建议自建 EMQX 并设账号密码。",
                11f, Ui.TEXT_FAINT, false);
        t.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
        box.addView(t);
        return box;
    }

    // ---------------- 零件 ----------------
    private TextView fieldLabel(String s) {
        TextView t = Ui.text(this, s, 11f, Ui.TEXT_FAINT, false);
        t.setPadding(0, Ui.dp(this, 8), 0, Ui.dp(this, 4));
        return t;
    }

    private EditText input(String hint, int inputType) {
        EditText e = new EditText(this);
        e.setHint(hint);
        e.setHintTextColor(Ui.TEXT_FAINT);
        e.setTextSize(15f);
        e.setTextColor(Ui.TEXT);
        e.setInputType(inputType);
        e.setSingleLine(true);
        e.setBackground(Ui.roundStroke(this, Ui.SOFT, Ui.BORDER, 12f));
        int p = Ui.dp(this, 10);
        e.setPadding(p, Ui.dp(this, 8), p, Ui.dp(this, 8));
        return e;
    }

    private Button cmdChip(String label, final String cmd) {
        Button b = Ui.chip(this, label);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                m.publish(cmd, true);
            }
        });
        return b;
    }

    private void toast(String s) {
        android.widget.Toast.makeText(this, s, android.widget.Toast.LENGTH_SHORT).show();
    }

    private void copyToClipboard(String text) {
        ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) {
            cm.setPrimaryClip(ClipData.newPlainText("relay", text));
        }
    }

    // ---------------- 数据 ----------------
    private void fillFields() {
        etHost.setText(m.host);
        etPort.setText(String.valueOf(m.port));
        etUser.setText(m.user);
        etPass.setText(m.pass);
        cbReconnect.setChecked(m.autoReconnect);
    }

    private void readFields(boolean persist) {
        if (etHost == null) {
            return;
        }
        String h = etHost.getText().toString().trim();
        h = h.replaceFirst("^(mqtt|tcp)://", "");
        int slash = h.indexOf('/');
        if (slash >= 0) {
            h = h.substring(0, slash);
        }
        if (h.length() > 0) {
            m.host = h;
        }
        int p = 1883;
        try {
            p = Integer.parseInt(etPort.getText().toString().trim());
        } catch (Exception ignored) {
        }
        if (p > 0 && p < 65536) {
            m.port = p;
        }
        m.user = etUser.getText().toString().trim();
        m.pass = etPass.getText().toString();
        if (persist) {
            m.save();
        }
    }

    private void confirmRestart() {
        new AlertDialog.Builder(this)
                .setTitle("重启设备")
                .setMessage("当前设备会离线十几秒后自动重连，配置不会丢。确定重启吗？")
                .setPositiveButton("确定重启", new android.content.DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(android.content.DialogInterface dialog, int which) {
                        m.publish("rest", true);
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    private void showHelp() {
        new AlertDialog.Builder(this)
                .setTitle("怎么用")
                .setMessage("一、设备端（电脑上一次）\n"
                        + "1. 网络参数设置工具里搜到设备；\n"
                        + "2. 工作模式选 MQTT；\n"
                        + "3. 服务器 broker.emqx.io，端口 1883（不要用 8883）；\n"
                        + "4. 账号密码留空；\n"
                        + "5. 订阅/发布主题填设备 ID（如 8c4f0052013a）；\n"
                        + "6. 保存设置生效。\n\n"
                        + "二、手机端\n"
                        + "「我的设备 → 添加设备」填名称、设备 ID、备注即可；\n"
                        + "主界面顶部点设备胶囊就能切换；长按胶囊可以改名改备注。\n\n"
                        + "三、指令含义\n"
                        + "a1 开、b1 关、c1 点动 1 秒、qk 全开、qg 全断；\n"
                        + "n1=已导通、f1=已断开、s!-55=信号强度。")
                .setPositiveButton("知道了", null)
                .show();
    }

    // ---------------- 渲染 ----------------
    private void render() {
        if (m == null || tvStatus == null) {
            return;
        }
        RelayManager.Device cur = m.activeDevice();
        tvCurrentDevice.setText(cur == null ? "当前：还没有设备"
                : "当前：" + cur.label() + (cur.note.length() > 0 ? " · " + cur.note : ""));
        renderDeviceRows();

        String s;
        int color;
        if (m.connected) {
            s = "● 在线" + (m.devid.length() > 0 ? " · 设备 " + m.devid : "");
            color = Ui.GREEN;
        } else if (m.connecting) {
            s = "● 正在连接…";
            color = 0xFFB45309;
        } else {
            s = "● 未连接" + (m.lastError.length() > 0 ? " · " + m.lastError : "");
            color = Ui.TEXT_DIM;
        }
        tvStatus.setText(s);
        tvStatus.setTextColor(color);
    }

    private void renderDeviceRows() {
        if (deviceList == null) {
            return;
        }
        deviceList.removeAllViews();
        if (m.devices.isEmpty()) {
            TextView empty = Ui.text(this, "还没有设备，点下面按钮添加", 12f, Ui.TEXT_FAINT, false);
            empty.setPadding(0, Ui.dp(this, 6), 0, Ui.dp(this, 6));
            deviceList.addView(empty);
            return;
        }
        for (int i = 0; i < m.devices.size(); i++) {
            final int index = i;
            RelayManager.Device d = m.devices.get(i);
            boolean on = i == m.activeIndex();

            LinearLayout row = Ui.row(this);
            row.setBackground(on
                    ? Ui.round(this, Ui.GREEN_LIGHT, 12f)
                    : Ui.roundStroke(this, Ui.CARD, Ui.BORDER, 12f));
            int p = Ui.dp(this, 10);
            row.setPadding(p, Ui.dp(this, 8), p, Ui.dp(this, 8));
            LinearLayout.LayoutParams rlp = Ui.match();
            rlp.bottomMargin = Ui.dp(this, 6);
            row.setLayoutParams(rlp);

            LinearLayout texts = Ui.vertical(this);
            texts.addView(Ui.text(this, (on ? "● " : "") + d.label(), 14f, Ui.TEXT, true));
            String sub = (d.note.length() > 0 ? d.note + "　" : "") + "ID " + d.topic;
            texts.addView(Ui.text(this, sub, 11f, Ui.TEXT_FAINT, false));
            row.addView(texts, Ui.weight(1f));

            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    m.selectDevice(index);
                }
            });
            row.setOnLongClickListener(new View.OnLongClickListener() {
                @Override
                public boolean onLongClick(View v) {
                    DeviceDialogs.manage(SettingsActivity.this, m, index);
                    return true;
                }
            });

            Button edit = Ui.button(this, "编辑", 0x00000000, Ui.BLUE, 12f, 10f, 34f);
            LinearLayout.LayoutParams elp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            edit.setLayoutParams(elp);
            edit.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    DeviceDialogs.edit(SettingsActivity.this, m, index);
                }
            });
            row.addView(edit);

            Button del = Ui.button(this, "删除", 0x00000000, Ui.RED, 12f, 10f, 34f);
            LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            del.setLayoutParams(dlp);
            del.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    DeviceDialogs.confirmRemove(SettingsActivity.this, m, index);
                }
            });
            row.addView(del);
            deviceList.addView(row);
        }
    }

    private void renderLog() {
        if (tvLog == null) {
            return;
        }
        StringBuilder sb = new StringBuilder();
        for (String line : m.logSnapshot()) {
            sb.append(line).append('\n');
        }
        tvLog.setText(sb.length() == 0 ? "（还没有收发记录）" : sb.toString());
        if (svLog != null) {
            svLog.post(new Runnable() {
                @Override
                public void run() {
                    svLog.fullScroll(View.FOCUS_DOWN);
                }
            });
        }
    }

    private void renderCrash() {
        if (tvCrash == null) {
            return;
        }
        String c = m.lastCrash();
        if (c.length() == 0) {
            tvCrash.setVisibility(View.GONE);
        } else {
            tvCrash.setVisibility(View.VISIBLE);
            tvCrash.setText("上次崩溃记录：\n" + (c.length() > 1500 ? c.substring(0, 1500) : c));
        }
    }

    // ---------------- 监听 ----------------
    @Override
    public void onState() {
        render();
    }

    @Override
    public void onLog(String line) {
        if (devBody != null && devBody.getVisibility() == View.VISIBLE) {
            renderLog();
        }
    }
}
