package com.relay.one;

import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** 统一的界面零件工厂：卡片、胶囊按钮、色块、间距。只用系统控件 + 自绘圆角。 */
public final class Ui {

    // ---------- 配色（浅色现代风） ----------
    public static final int BG = 0xFFF4F6FA;
    public static final int CARD = 0xFFFFFFFF;
    public static final int BORDER = 0xFFE6EAF2;
    public static final int TEXT = 0xFF101720;
    public static final int TEXT_DIM = 0xFF6B7787;
    public static final int TEXT_FAINT = 0xFF9AA6B6;
    public static final int BLUE = 0xFF2563EB;
    public static final int BLUE_DARK = 0xFF1D4ED8;
    public static final int GREEN = 0xFF16A34A;
    public static final int GREEN_LIGHT = 0xFFE9F7EE;
    public static final int RED = 0xFFDC2626;
    public static final int RED_LIGHT = 0xFFFDECEC;
    public static final int SOFT = 0xFFF0F3F8;
    public static final int HEADER_TOP = 0xFF2563EB;
    public static final int HEADER_BOTTOM = 0xFF1E40AF;

    private Ui() {
    }

    public static int dp(Context c, float v) {
        return Math.round(v * c.getResources().getDisplayMetrics().density);
    }

    // ---------- 形状 ----------
    public static GradientDrawable round(Context c, int color, float radiusDp) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(dp(c, radiusDp));
        return d;
    }

    public static GradientDrawable roundStroke(Context c, int color, int stroke, float radiusDp) {
        GradientDrawable d = round(c, color, radiusDp);
        d.setStroke(Math.max(1, dp(c, 1)), stroke);
        return d;
    }

    public static GradientDrawable gradient(Context c, int top, int bottom) {
        GradientDrawable d = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{top, bottom});
        d.setCornerRadius(0f);
        return d;
    }

    public static GradientDrawable circle(Context c, int color) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.OVAL);
        d.setColor(color);
        return d;
    }

    // ---------- 布局 ----------
    public static LinearLayout vertical(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.VERTICAL);
        return l;
    }

    public static LinearLayout row(Context c) {
        LinearLayout l = new LinearLayout(c);
        l.setOrientation(LinearLayout.HORIZONTAL);
        l.setGravity(Gravity.CENTER_VERTICAL);
        return l;
    }

    public static LinearLayout.LayoutParams weight(float w) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, w);
        lp.setMargins(dp3(), dp3(), dp3(), dp3());
        return lp;
    }

    public static LinearLayout.LayoutParams match() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    public static LinearLayout.LayoutParams fixed(int heightDp) {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                heightDp);
    }

    private static int dp3() {
        return 3;
    }

    // ---------- 文本 ----------
    public static TextView text(Context c, CharSequence s, float sp, int color, boolean bold) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(sp);
        t.setTextColor(color);
        if (bold) {
            t.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return t;
    }

    public static TextView hint(Context c, CharSequence s) {
        return text(c, s, 12f, TEXT_FAINT, false);
    }

    public static TextView sectionTitle(Context c, String s) {
        TextView t = text(c, s, 12f, TEXT_DIM, true);
        t.setPadding(dp(c, 2), dp(c, 4), 0, dp(c, 8));
        return t;
    }

    // ---------- 按钮 ----------
    public static Button button(Context c, String text, int bg, int fg, float sp, float radiusDp, float heightDp) {
        Button b = new Button(c);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextSize(sp);
        b.setTextColor(fg);
        b.setBackground(round(c, bg, radiusDp));
        b.setPadding(dp(c, 8), dp(c, 8), dp(c, 8), dp(c, 8));
        b.setMinimumHeight(dp(c, heightDp));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        b.setLayoutParams(lp);
        return b;
    }

    public static Button chip(Context c, String text) {
        return button(c, text, SOFT, TEXT, 14f, 14f, 46f);
    }

    public static Button primary(Context c, String text, int bg) {
        return button(c, text, bg, 0xFFFFFFFF, 17f, 16f, 56f);
    }

    // ---------- 卡片 ----------
    public static LinearLayout card(Context c) {
        LinearLayout card = vertical(c);
        card.setBackground(roundStroke(c, CARD, BORDER, 18f));
        int p = dp(c, 16);
        card.setPadding(p, p, p, p);
        LinearLayout.LayoutParams lp = match();
        lp.setMargins(dp(c, 14), dp(c, 6), dp(c, 14), dp(c, 6));
        card.setLayoutParams(lp);
        return card;
    }

    public static View spacer(Context c, float h) {
        View v = new View(c);
        v.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(c, h)));
        return v;
    }

    public static View divider(Context c) {
        View v = new View(c);
        v.setBackground(round(c, BORDER, 0.5f));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(c, 1)));
        lp.setMargins(0, dp(c, 12), 0, dp(c, 12));
        v.setLayoutParams(lp);
        return v;
    }

    /** 信息格：上面小灰字，下面大黑字。 */
    public static TextView infoCell(Context c, LinearLayout parent, String title) {
        LinearLayout box = vertical(c);
        box.setPadding(0, dp(c, 6), 0, dp(c, 6));

        TextView label = text(c, title, 11f, TEXT_FAINT, false);
        box.addView(label);

        TextView value = text(c, "—", 14f, TEXT, true);
        value.setPadding(0, dp(c, 2), 0, 0);
        value.setSingleLine(true);
        box.addView(value);

        parent.addView(box, weight(1f));
        return value;
    }

    public static View dot(Context c, int color) {
        View v = new View(c);
        v.setBackground(circle(c, color));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(c, 8), dp(c, 8));
        lp.setMargins(0, 0, dp(c, 6), 0);
        v.setLayoutParams(lp);
        return v;
    }

    public static void marginBottom(View v, Context c, float dp) {
        ViewGroup.LayoutParams lp = v.getLayoutParams();
        if (lp instanceof LinearLayout.LayoutParams) {
            ((LinearLayout.LayoutParams) lp).bottomMargin = dp(c, dp);
        }
    }
}
