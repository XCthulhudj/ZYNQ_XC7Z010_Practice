package com.relay.one;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** 添加 / 编辑 / 删除设备的对话框。 */
public final class DeviceDialogs {

    private DeviceDialogs() {
    }

    public static void add(final Activity a, final RelayManager m) {
        final EditText etName = field(a, "名称，例如 客厅灯", "", InputType.TYPE_CLASS_TEXT);
        final EditText etTopic = field(a, "设备 ID（配置工具里的主题）", "", InputType.TYPE_CLASS_TEXT);
        final EditText etNote = field(a, "备注，例如 一楼客厅吸顶灯", "", InputType.TYPE_CLASS_TEXT);

        LinearLayout box = Ui.vertical(a);
        int p = Ui.dp(a, 4);
        box.setPadding(Ui.dp(a, 18), p, Ui.dp(a, 18), p);
        box.addView(label(a, "名称（可留空，默认用设备 ID）"));
        box.addView(etName);
        box.addView(label(a, "设备 ID"));
        box.addView(etTopic);
        box.addView(label(a, "备注（可留空，用来区分用途）"));
        box.addView(etNote);

        new AlertDialog.Builder(a)
                .setTitle("添加设备")
                .setView(box)
                .setPositiveButton("添加并连接", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        String topic = etTopic.getText().toString().trim();
                        if (topic.length() == 0) {
                            toast(a, "设备 ID 不能为空");
                            return;
                        }
                        m.addDevice(etName.getText().toString(), topic, etNote.getText().toString());
                        toast(a, "已添加 " + (etName.getText().toString().trim().length() > 0
                                ? etName.getText().toString().trim() : topic));
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    public static void manage(final Activity a, final RelayManager m, final int index) {
        if (index < 0 || index >= m.devices.size()) {
            return;
        }
        RelayManager.Device d = m.devices.get(index);
        String title = d.label() + (d.note.length() > 0 ? " · " + d.note : "");
        new AlertDialog.Builder(a)
                .setTitle(title)
                .setItems(new String[]{"编辑名称 / 备注", "切换到此设备", "删除设备"},
                        new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                if (which == 0) {
                                    edit(a, m, index);
                                } else if (which == 1) {
                                    m.selectDevice(index);
                                } else {
                                    confirmDelete(a, m, index);
                                }
                            }
                        })
                .setNegativeButton("取消", null)
                .show();
    }

    public static void edit(final Activity a, final RelayManager m, final int index) {
        if (index < 0 || index >= m.devices.size()) {
            return;
        }
        RelayManager.Device d = m.devices.get(index);
        final EditText etName = field(a, "名称", d.name, InputType.TYPE_CLASS_TEXT);
        final EditText etNote = field(a, "备注", d.note, InputType.TYPE_CLASS_TEXT);
        TextView topicInfo = Ui.text(a, "设备 ID：" + d.topic + "（不可改）", 11f, Ui.TEXT_FAINT, false);

        LinearLayout box = Ui.vertical(a);
        box.setPadding(Ui.dp(a, 18), Ui.dp(a, 4), Ui.dp(a, 18), Ui.dp(a, 4));
        box.addView(label(a, "名称"));
        box.addView(etName);
        box.addView(label(a, "备注（写用途，方便区分）"));
        box.addView(etNote);
        box.addView(topicInfo);

        new AlertDialog.Builder(a)
                .setTitle("编辑设备")
                .setView(box)
                .setPositiveButton("保存", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        m.updateDevice(index, etName.getText().toString(), etNote.getText().toString());
                        toast(a, "已保存");
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    private static void confirmDelete(final Activity a, final RelayManager m, final int index) {
        confirmRemove(a, m, index);
    }

    public static void confirmRemove(final Activity a, final RelayManager m, final int index) {
        if (index < 0 || index >= m.devices.size()) {
            return;
        }
        RelayManager.Device d = m.devices.get(index);
        new AlertDialog.Builder(a)
                .setTitle("删除设备")
                .setMessage("确定删除「" + d.label() + "」吗？只是从手机列表里移除，不影响设备本身。")
                .setPositiveButton("删除", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        m.removeDevice(index);
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    // ---------- 小零件 ----------
    private static EditText field(Activity a, String hint, String value, int type) {
        EditText e = new EditText(a);
        e.setHint(hint);
        e.setHintTextColor(Ui.TEXT_FAINT);
        e.setTextSize(15f);
        e.setTextColor(Ui.TEXT);
        e.setInputType(type);
        e.setSingleLine(true);
        e.setText(value == null ? "" : value);
        e.setBackground(Ui.roundStroke(a, Ui.SOFT, Ui.BORDER, 12f));
        e.setPadding(Ui.dp(a, 10), Ui.dp(a, 8), Ui.dp(a, 10), Ui.dp(a, 8));
        return e;
    }

    private static TextView label(Activity a, String text) {
        TextView t = Ui.text(a, text, 11f, Ui.TEXT_FAINT, false);
        t.setPadding(0, Ui.dp(a, 8), 0, Ui.dp(a, 4));
        return t;
    }

    private static void toast(Activity a, String s) {
        Toast.makeText(a, s, Toast.LENGTH_SHORT).show();
    }

    /** 供设置页复用的行点击。 */
    public static void showPicker(final Activity a, final RelayManager m) {
        int n = m.devices.size();
        if (n == 0) {
            add(a, m);
            return;
        }
        String[] items = new String[n];
        for (int i = 0; i < n; i++) {
            RelayManager.Device d = m.devices.get(i);
            items[i] = d.label() + (d.note.length() > 0 ? "（" + d.note + "）" : "");
        }
        new AlertDialog.Builder(a)
                .setTitle("选择设备")
                .setItems(items, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        m.selectDevice(which);
                    }
                })
                .setNegativeButton("取消", null)
                .show();
    }

    static void noop(View v) {
    }
}
