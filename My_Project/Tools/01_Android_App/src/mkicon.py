# -*- coding: utf-8 -*-
"""生成「远程开关MQTT」的图标：
  - 传统 PNG（mdpi~xxxhdpi，蓝色渐变圆角方块 + 白色电源符号）
  - 自适应图标（Android 8+）：纯色底 + 矢量前景
纯标准库，3 倍超采样抗锯齿。
"""
import math
import os
import struct
import zlib

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "app", "res")
SS = 3

TOP = (37, 99, 235)      # #2563EB
BOTTOM = (29, 78, 216)   # #1D4ED8
GLYPH = (255, 255, 255)

SIZES = {"mdpi": 48, "hdpi": 72, "xhdpi": 96, "xxhdpi": 144, "xxxhdpi": 192}


def clamp(v):
    return 0 if v < 0 else (255 if v > 255 else int(v))


def in_rounded_rect(x, y, w, r):
    if x < r and y < r:
        return (x - r) ** 2 + (y - r) ** 2 <= r * r
    if x > w - r and y < r:
        return (x - (w - r)) ** 2 + (y - r) ** 2 <= r * r
    if x < r and y > w - r:
        return (x - r) ** 2 + (y - (w - r)) ** 2 <= r * r
    if x > w - r and y > w - r:
        return (x - (w - r)) ** 2 + (y - (w - r)) ** 2 <= r * r
    return True


def shade(x, y, size):
    """按 108 单位的坐标系画，再按 size 缩放；返回 RGBA。"""
    u = 108.0 / size
    gx = x * u
    gy = y * u

    if not in_rounded_rect(x, y, size, size * 0.22):
        return (0, 0, 0, 0)

    cx, cy, r, stroke = 54.0, 58.0, 20.0, 7.0
    dx, dy = gx - cx, gy - cy
    dist = math.hypot(dx, dy)

    in_ring = abs(dist - r) <= stroke / 2
    angle = math.atan2(dx, -dy)          # 0 = 正上方，顺时针为正
    in_gap = in_ring and abs(angle) < math.radians(28)

    in_bar = abs(dx) <= stroke / 2 and 29.0 <= gy <= 51.0

    if (in_ring and not in_gap) or in_bar:
        return (GLYPH[0], GLYPH[1], GLYPH[2], 255)

    t = max(0.0, min(1.0, y / float(size)))
    return (clamp(TOP[0] + (BOTTOM[0] - TOP[0]) * t),
            clamp(TOP[1] + (BOTTOM[1] - TOP[1]) * t),
            clamp(TOP[2] + (BOTTOM[2] - TOP[2]) * t),
            255)


def write_png(path, size):
    w = size * SS
    big = [[shade(x + 0.5, y + 0.5, w) for x in range(w)] for y in range(w)]

    raw = bytearray()
    for oy in range(size):
        raw.append(0)
        row = []
        for ox in range(size):
            r = g = b = a = 0
            for dyy in range(SS):
                for dxx in range(SS):
                    px = big[oy * SS + dyy][ox * SS + dxx]
                    r += px[0]
                    g += px[1]
                    b += px[2]
                    a += px[3]
            n = SS * SS
            if a == 0:
                row += [0, 0, 0, 0]
            else:
                cnt = 0
                for dyy in range(SS):
                    for dxx in range(SS):
                        if big[oy * SS + dyy][ox * SS + dxx][3] > 0:
                            cnt += 1
                cnt = max(1, cnt)
                row += [clamp(r / cnt), clamp(g / cnt), clamp(b / cnt), clamp(a / n)]
        raw += bytes(row)

    def chunk(tag, data):
        return (struct.pack(">I", len(data)) + tag + data
                + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF))

    png = (b"\x89PNG\r\n\x1a\n"
           + chunk(b"IHDR", struct.pack(">IIBBBBB", size, size, 8, 6, 0, 0, 0))
           + chunk(b"IDAT", zlib.compress(bytes(raw), 9))
           + chunk(b"IEND", b""))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "wb") as fh:
        fh.write(png)
    print("  %-44s %d px" % (os.path.relpath(path, BASE), size))


FOREGROUND = '''<?xml version="1.0" encoding="utf-8"?>
<!-- 电源符号：圆环（顶部缺口）+ 竖条，108x108 视口内居中 -->
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp"
    android:height="108dp"
    android:viewportWidth="108"
    android:viewportHeight="108">

    <path
        android:pathData="M71.32,48 A20,20 0 1 1 36.68,48"
        android:strokeColor="#FFFFFF"
        android:strokeWidth="7"
        android:strokeLineCap="round"
        android:fillColor="#00000000" />

    <path
        android:pathData="M54,29 L54,51"
        android:strokeColor="#FFFFFF"
        android:strokeWidth="7"
        android:strokeLineCap="round"
        android:fillColor="#00000000" />
</vector>
'''

ADAPTIVE = '''<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_bg" />
    <foreground android:drawable="@drawable/ic_launcher_fg" />
</adaptive-icon>
'''

COLORS = '''<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_bg">#2563EB</color>
</resources>
'''


def put(rel, text):
    path = os.path.join(BASE, rel.replace("/", os.sep))
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as fh:
        fh.write(text)
    print("  " + rel)


def main():
    for bucket, size in SIZES.items():
        write_png(os.path.join(BASE, "mipmap-" + bucket, "ic_launcher.png"), size)

    put("mipmap-anydpi-v26/ic_launcher.xml", ADAPTIVE)
    put("drawable/ic_launcher_fg.xml", FOREGROUND)
    put("values/colors.xml", COLORS)

    old = os.path.join(BASE, "mipmap", "ic_launcher.png")
    if os.path.exists(old):
        os.remove(old)
        try:
            os.rmdir(os.path.dirname(old))
        except OSError:
            pass
        print("  已删除旧的 mipmap/ic_launcher.png")


if __name__ == "__main__":
    main()
