# -*- coding: utf-8 -*-
"""生成一套极简 Android UI 桩类，用来在桌面 JVM 上真正跑起 MainActivity.onCreate()。

重点复刻真实 Android 的这些约束（v1.0/v1.1 的闪退就是违反了它们）：
  1) ViewGroup.addView：子 View 已经有父容器 -> IllegalStateException
  2) Activity.setContentView：传进来的 View 已经有父容器 -> IllegalStateException
  3) LinearLayout 只接受 LinearLayout.LayoutParams
"""
import os

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "stubs")

FILES = {}

FILES["android/view/View.java"] = """
package android.view;

import android.graphics.drawable.Drawable;
import android.os.Handler;

public class View {
    public interface OnClickListener { void onClick(View v); }

    public interface OnLongClickListener { boolean onLongClick(View v); }

    public static final int FOCUS_DOWN = 130;
    public static final int VISIBLE = 0;
    public static final int GONE = 8;

    public ViewGroup parent;
    private ViewGroup.LayoutParams layoutParams;
    private OnClickListener listener;
    private OnLongClickListener longListener;
    private Drawable background;
    public int visibility = VISIBLE;
    public int paddingLeft, paddingTop, paddingRight, paddingBottom;
    public int minHeight, minWidth;
    public float textSize;

    public View() { }

    public View(android.content.Context c) { }

    public int getVisibility() { return visibility; }

    public void setOnClickListener(OnClickListener l) { this.listener = l; }

    public void setOnLongClickListener(OnLongClickListener l) { this.longListener = l; }

    public boolean performLongClick() {
        if (longListener == null) return false;
        return longListener.onLongClick(this);
    }
    public boolean performClick() {
        if (listener == null) return false;
        listener.onClick(this);
        return true;
    }
    public OnClickListener getListener() { return listener; }

    public void setBackground(Drawable d) { this.background = d; }
    public Drawable getBackground() { return background; }

    public void setLayoutParams(ViewGroup.LayoutParams lp) { this.layoutParams = lp; }
    public ViewGroup.LayoutParams getLayoutParams() { return layoutParams; }
    public ViewGroup getParent() { return parent; }

    public void setPadding(int l, int t, int r, int b) {
        paddingLeft = l; paddingTop = t; paddingRight = r; paddingBottom = b;
    }
    public void setVisibility(int v) { visibility = v; }
    public void setMinimumHeight(int h) { minHeight = h; }
    public void setMinimumWidth(int w) { minWidth = w; }
    public void setMinHeight(int h) { minHeight = h; }
    public void setBackgroundColor(int c) { }
    public void requestLayout() { }
    public void invalidate() { }

    public boolean post(Runnable r) {
        synchronized (Handler.QUEUE) { Handler.QUEUE.add(r); }
        return true;
    }
    public boolean postDelayed(Runnable r, long delay) { return post(r); }
    public boolean requestFocus() { return true; }
}
"""

FILES["android/view/ViewGroup.java"] = """
package android.view;

import java.util.ArrayList;
import java.util.List;

public class ViewGroup extends View {

    public static class LayoutParams {
        public static final int MATCH_PARENT = -1;
        public static final int WRAP_CONTENT = -2;
        public int width;
        public int height;
        public int leftMargin, topMargin, rightMargin, bottomMargin;

        public LayoutParams(int w, int h) { this.width = w; this.height = h; }

        public void setMargins(int l, int t, int r, int b) {
            leftMargin = l; topMargin = t; rightMargin = r; bottomMargin = b;
        }
    }

    public final List<View> children = new ArrayList<View>();

    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p != null;
    }

    protected LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
    }

    public void addView(View child) {
        LayoutParams lp = child == null ? null : child.getLayoutParams();
        if (lp == null) lp = generateDefaultLayoutParams();
        addView(child, lp);
    }

    public void addView(View child, LayoutParams params) {
        if (child == null) {
            throw new IllegalArgumentException("child == null");
        }
        if (child.getParent() != null) {
            throw new IllegalStateException(
                    "The specified child already has a parent. "
                            + "You must call removeView() on the child's parent first.");
        }
        if (params == null) params = generateDefaultLayoutParams();
        if (!checkLayoutParams(params)) {
            throw new IllegalArgumentException(
                    "addView: 参数类型不对，需要 " + getClass().getSimpleName() + ".LayoutParams");
        }
        child.parent = this;
        child.setLayoutParams(params);
        children.add(child);
        onChildAdded(child);
    }

    protected void onChildAdded(View child) { }

    public void removeView(View child) {
        if (children.remove(child)) {
            child.parent = null;
        }
    }

    public void removeAllViews() {
        for (View v : children) { v.parent = null; }
        children.clear();
    }

    public int getChildCount() { return children.size(); }

    public View getChildAt(int i) { return children.get(i); }
}
"""

FILES["android/view/Gravity.java"] = """
package android.view;

public class Gravity {
    public static final int CENTER_VERTICAL = 16;
    public static final int CENTER_HORIZONTAL = 1;
    public static final int CENTER = 17;
}
"""

FILES["android/view/Window.java"] = """
package android.view;

public class Window {
    public int statusBarColor;
    public int navigationBarColor;
    public void setStatusBarColor(int c) { statusBarColor = c; }
    public void setNavigationBarColor(int c) { navigationBarColor = c; }
}
"""

FILES["android/widget/TextView.java"] = """
package android.widget;

import android.graphics.Typeface;
import android.view.View;

public class TextView extends View {
    public TextView(android.content.Context c) { }
    private CharSequence text = "";
    private CharSequence hint = "";
    public int textColor;
    public Typeface typeface;
    public int gravity;
    public boolean selectable;
    public boolean singleLine;
    public int inputType;

    public void setText(CharSequence t) { this.text = t; }
    public CharSequence getText() { return text; }
    public void setTextColor(int c) { textColor = c; }
    public void setTextSize(float s) { textSize = s; }
    public void setTypeface(Typeface tf) { typeface = tf; }
    public void setGravity(int g) { gravity = g; }
    public void setHint(CharSequence h) { hint = h; }
    public CharSequence getHint() { return hint; }
    public void setHintTextColor(int c) { }
    public void setSingleLine(boolean b) { singleLine = b; }
    public void setTextIsSelectable(boolean b) { selectable = b; }
    public void setInputType(int t) { inputType = t; }
    public void append(CharSequence s) { text = text.toString() + s.toString(); }
    public void setTextSize(int unit, float size) { textSize = size; }
}
"""

FILES["android/widget/Button.java"] = """
package android.widget;

public class Button extends TextView {
    public Button(android.content.Context c) { super(c); }
    public boolean allCaps = true;
    public void setAllCaps(boolean b) { allCaps = b; }
}
"""

FILES["android/widget/EditText.java"] = """
package android.widget;

public class EditText extends TextView {
    public EditText(android.content.Context c) { super(c); }
}
"""

FILES["android/widget/CheckBox.java"] = """
package android.widget;

public class CheckBox extends Button {
    public CheckBox(android.content.Context c) { super(c); }
    private boolean checked;
    public void setChecked(boolean b) { checked = b; }
    public boolean isChecked() { return checked; }
}
"""

FILES["android/widget/LinearLayout.java"] = """
package android.widget;

import android.view.ViewGroup;

public class LinearLayout extends ViewGroup {
    public LinearLayout(android.content.Context c) { }
    public static final int HORIZONTAL = 0;
    public static final int VERTICAL = 1;

    public static class LayoutParams extends ViewGroup.LayoutParams {
        public float weight;
        public LayoutParams(int w, int h) { super(w, h); }
        public LayoutParams(int w, int h, float weight) { super(w, h); this.weight = weight; }
    }

    public int orientation;
    public int gravity;

    public void setOrientation(int o) { orientation = o; }
    public void setGravity(int g) { gravity = g; }

    @Override
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override
    protected LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
    }
}
"""

FILES["android/widget/HorizontalScrollView.java"] = """
package android.widget;

public class HorizontalScrollView extends android.view.ViewGroup {
    public HorizontalScrollView(android.content.Context c) { }
    public void setHorizontalScrollBarEnabled(boolean b) { }
    public void setFillViewport(boolean b) { }
}
"""

FILES["android/widget/ScrollView.java"] = """
package android.widget;

public class ScrollView extends android.view.ViewGroup {
    public ScrollView(android.content.Context c) { }
    public void setFillViewport(boolean b) { }
    public void fullScroll(int direction) { }
}
"""

FILES["android/widget/Toast.java"] = """
package android.widget;

import android.content.Context;

public class Toast {
    public static final int LENGTH_SHORT = 0;
    public static final int LENGTH_LONG = 1;
    public static String lastText = "";

    public static Toast makeText(Context c, CharSequence text, int duration) {
        lastText = text == null ? "" : text.toString();
        return new Toast();
    }
    public void show() { }
}
"""

FILES["android/content/DialogInterface.java"] = """
package android.content;

public interface DialogInterface {
    interface OnClickListener {
        void onClick(DialogInterface dialog, int which);
    }
    void dismiss();
}
"""

FILES["android/content/SharedPreferences.java"] = """
package android.content;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class SharedPreferences {

    public interface Editor {
        Editor putString(String k, String v);
        Editor putInt(String k, int v);
        Editor putBoolean(String k, boolean v);
        Editor remove(String k);
        void apply();
        boolean commit();
    }

    public final Map<String, Object> data = new HashMap<String, Object>();

    public String getString(String k, String def) {
        Object v = data.get(k);
        return v == null ? def : v.toString();
    }

    public int getInt(String k, int def) {
        Object v = data.get(k);
        return v == null ? def : (Integer) v;
    }

    public boolean getBoolean(String k, boolean def) {
        Object v = data.get(k);
        return v == null ? def : (Boolean) v;
    }

    public Editor edit() {
        return new Editor() {
            private final Map<String, Object> pending = new HashMap<String, Object>();
            private final Set<String> removed = new HashSet<String>();

            public Editor putString(String k, String v) { pending.put(k, v); return this; }
            public Editor putInt(String k, int v) { pending.put(k, v); return this; }
            public Editor putBoolean(String k, boolean v) { pending.put(k, v); return this; }
            public Editor remove(String k) { removed.add(k); return this; }

            public void apply() {
                for (String k : removed) data.remove(k);
                data.putAll(pending);
            }

            public boolean commit() {
                apply();
                return true;
            }
        };
    }
}
"""

FILES["android/content/ClipData.java"] = """
package android.content;

public class ClipData {
    public String text;
    public static ClipData newPlainText(CharSequence label, CharSequence text) {
        ClipData c = new ClipData();
        c.text = text == null ? "" : text.toString();
        return c;
    }
}
"""

FILES["android/content/ClipboardManager.java"] = """
package android.content;

public class ClipboardManager {
    public static String lastText = "";
    public void setPrimaryClip(ClipData c) {
        lastText = c == null ? "" : c.text;
    }
}
"""

FILES["android/content/Intent.java"] = """
package android.content;

public class Intent {
    public Class<?> target;
    public Intent(Context c, Class<?> cls) { this.target = cls; }
}
"""

FILES["android/content/Context.java"] = """
package android.content;

import android.content.res.Resources;
import java.util.HashMap;
import java.util.Map;

public class Context {
    public static final int MODE_PRIVATE = 0;
    public static final String CLIPBOARD_SERVICE = "clipboard";

    private static final Map<String, SharedPreferences> PREFS = new HashMap<String, SharedPreferences>();
    private final Map<String, Object> services = new HashMap<String, Object>();

    public SharedPreferences getSharedPreferences(String name, int mode) {
        SharedPreferences p = PREFS.get(name);
        if (p == null) {
            p = new SharedPreferences();
            PREFS.put(name, p);
        }
        return p;
    }

    public Object getSystemService(String name) {
        Object s = services.get(name);
        if (s == null) {
            if (CLIPBOARD_SERVICE.equals(name)) {
                s = new ClipboardManager();
            } else {
                s = new Object();
            }
            services.put(name, s);
        }
        return s;
    }

    public Context getApplicationContext() { return this; }

    public Resources getResources() { return Resources.INSTANCE; }
}
"""

FILES["android/content/res/Resources.java"] = """
package android.content.res;

import android.util.DisplayMetrics;

public class Resources {
    public static final Resources INSTANCE = new Resources();
    private final DisplayMetrics metrics = new DisplayMetrics();

    public DisplayMetrics getDisplayMetrics() { return metrics; }
}
"""

FILES["android/util/DisplayMetrics.java"] = """
package android.util;

public class DisplayMetrics {
    public float density = 2.0f;
    public int densityDpi = 320;
    public int widthPixels = 1080;
    public int heightPixels = 2200;
}
"""

FILES["android/graphics/Typeface.java"] = """
package android.graphics;

public class Typeface {
    public static final Typeface DEFAULT = new Typeface();
    public static final Typeface DEFAULT_BOLD = new Typeface();
    public static final Typeface MONOSPACE = new Typeface();
}
"""

FILES["android/graphics/drawable/Drawable.java"] = """
package android.graphics.drawable;

public class Drawable {
}
"""

FILES["android/graphics/drawable/GradientDrawable.java"] = """
package android.graphics.drawable;

public class GradientDrawable extends Drawable {
    public enum Orientation { TOP_BOTTOM, TR_BL, RIGHT_LEFT, LEFT_RIGHT }
    public static final int OVAL = 1;
    public static final int RECTANGLE = 0;

    public int color;
    public float cornerRadius;
    public int strokeWidth, strokeColor;
    public int shape = RECTANGLE;
    public int[] colors;

    public GradientDrawable() { }

    public GradientDrawable(Orientation o, int[] colors) { this.colors = colors; }

    public void setColor(int c) { color = c; }
    public void setColors(int[] c) { colors = c; }
    public void setCornerRadius(float r) { cornerRadius = r; }
    public void setStroke(int w, int c) { strokeWidth = w; strokeColor = c; }
    public void setShape(int s) { shape = s; }
}
"""

FILES["android/os/Bundle.java"] = """
package android.os;

public class Bundle {
}
"""

FILES["android/os/Looper.java"] = """
package android.os;

public class Looper {
    private static final Looper MAIN = new Looper();
    public static Looper getMainLooper() { return MAIN; }
}
"""

FILES["android/os/Handler.java"] = """
package android.os;

import java.util.ArrayList;
import java.util.List;

/** 只排队、不自动执行；由冒烟测试决定什么时候跑，保证可复现。 */
public class Handler {

    public static final List<Runnable> QUEUE = new ArrayList<Runnable>();

    public Handler(Looper looper) { }

    public boolean post(Runnable r) {
        synchronized (QUEUE) { QUEUE.add(r); }
        return true;
    }

    public boolean postDelayed(Runnable r, long delay) {
        synchronized (QUEUE) { QUEUE.add(r); }
        return true;
    }

    public void removeCallbacks(Runnable r) {
        synchronized (QUEUE) { QUEUE.remove(r); }
    }

    /** 依次执行排队的任务，最多 n 个；返回执行个数。 */
    public static int drain(int n) {
        int done = 0;
        while (done < n) {
            Runnable r;
            synchronized (QUEUE) {
                if (QUEUE.isEmpty()) break;
                r = QUEUE.remove(0);
            }
            r.run();
            done++;
        }
        return done;
    }
}
"""

FILES["android/os/Build.java"] = """
package android.os;

public class Build {
    public static final String MANUFACTURER = "DeskTest";
    public static final String MODEL = "JVM";
    public static final String BRAND = "DeskTest";

    public static class VERSION {
        public static final String RELEASE = "14";
        public static final int SDK_INT = 34;
    }
}
"""

FILES["android/text/InputType.java"] = """
package android.text;

public class InputType {
    public static final int TYPE_CLASS_TEXT = 0x00000001;
    public static final int TYPE_CLASS_NUMBER = 0x00000002;
    public static final int TYPE_TEXT_VARIATION_PASSWORD = 0x00000080;
}
"""

FILES["android/app/AlertDialog.java"] = """
package android.app;

import android.content.Context;
import android.content.DialogInterface;

public class AlertDialog implements DialogInterface {

    public static class Builder {
        public String title, message;
        public String[] items;
        public DialogInterface.OnClickListener itemsListener;

        public Builder(Context c) { }
        public Builder setTitle(CharSequence t) { title = t == null ? null : t.toString(); return this; }
        public Builder setMessage(CharSequence m) { message = m == null ? null : m.toString(); return this; }
        public android.view.View dialogView;
        public Builder setView(android.view.View v) { dialogView = v; return this; }
        public Builder setItems(String[] items, DialogInterface.OnClickListener l) {
            this.items = items; this.itemsListener = l; return this;
        }
        public Builder setPositiveButton(CharSequence t, DialogInterface.OnClickListener l) { return this; }
        public Builder setNegativeButton(CharSequence t, DialogInterface.OnClickListener l) { return this; }
        public AlertDialog show() { return new AlertDialog(); }
    }

    public void dismiss() { }
}
"""

FILES["android/app/Activity.java"] = """
package android.app;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.Window;

public class Activity extends Context {

    private final Window window = new Window();
    private View contentView;

    public Window getWindow() { return window; }

    /** 复刻 PhoneWindow.setContentView 的约束：传进来的 View 不能已有父容器。 */
    public void setContentView(View v) {
        if (v == null) {
            throw new IllegalArgumentException("contentView == null");
        }
        if (v.getParent() != null) {
            throw new IllegalStateException(
                    "The specified child already has a parent. "
                            + "You must call removeView() on the child's parent first.");
        }
        this.contentView = v;
    }

    public View getContentView() { return contentView; }

    public void startActivity(android.content.Intent i) { }

    public void finish() { }

    public void runOnUiThread(Runnable r) { r.run(); }

    protected void onCreate(Bundle b) { }
    protected void onResume() { }
    protected void onPause() { }
    protected void onDestroy() { }
    protected void onStart() { }
    protected void onStop() { }
    protected void onRestart() { }
}
"""


def main():
    for rel, src in FILES.items():
        path = os.path.join(ROOT, rel.replace("/", os.sep))
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as fh:
            fh.write(src.lstrip("\n"))
    print("生成 %d 个桩类文件到 %s" % (len(FILES), ROOT))


if __name__ == "__main__":
    main()
