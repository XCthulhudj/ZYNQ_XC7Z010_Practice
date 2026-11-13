#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""把带注释的 C 源码渲染成深色主题 PNG（只用本机 Chrome/Edge 截图，无第三方依赖）。

用法示例：
    python Tools/render_code_png.py ^
        --src Docs/axi_key_irq_annotated.c ^
        --out Docs/axi_key_irq_annotated.png ^
        --title "PS + PL 双路按键中断控制 LED（注释版）" ^
        --subtitle "Zynq-7000 XC7Z010 · ..." ^
        --note "要点1" --note "要点2"

原理：生成一个 HTML -> 用 headless 浏览器 dump-dom 量出页面高度 ->
按该高度截图（--force-device-scale-factor=N 得到高清 PNG）。
"""

import argparse
import html
import os
import re
import subprocess
import sys
import tempfile

# ---------------------------------------------------------------- 语法着色 ---

TOKEN_RE = re.compile(
    r"""
      (?P<block>/\*[\s\S]*?\*/)
    | (?P<line>//[^\n]*)
    | (?P<pp>^[ \t]*\#[^\n]*)
    | (?P<str>"(?:\\.|[^"\\])*")
    | (?P<chr>'(?:\\.|[^'\\])*')
    | (?P<num>\b(?:0[xX][0-9a-fA-F]+|\d+)(?:[uUlL]+)?\b)
    | (?P<id>[A-Za-z_]\w*)
    """,
    re.VERBOSE | re.MULTILINE,
)

KEYWORDS = {
    "if", "else", "while", "for", "do", "return", "break", "continue", "switch",
    "case", "default", "goto", "sizeof", "static", "const", "volatile",
    "extern", "register", "inline", "typedef", "struct", "union", "enum",
}
TYPES = {
    "void", "int", "char", "short", "long", "float", "double", "signed",
    "unsigned", "uint8_t", "uint16_t", "uint32_t", "uint64_t", "int8_t",
    "int16_t", "int32_t", "int64_t", "u8", "u16", "u32", "u64", "s8", "s16",
    "s32", "s64", "size_t", "uintptr_t", "UINTPTR", "Xil_InterruptHandler",
}


def classify(name: str, src: str, end: int) -> str:
    if name in KEYWORDS:
        return "kw"
    if name in TYPES:
        return "ty"
    nxt = src[end:end + 40].lstrip()
    if nxt.startswith("("):
        return "fn"
    if re.fullmatch(r"[A-Z_][A-Z0-9_]*", name):
        return "mac"
    return "id"


def highlight(src: str):
    """返回 [(css_class, text), ...]"""
    out = []
    pos = 0
    for m in TOKEN_RE.finditer(src):
        if m.start() > pos:
            out.append(("", src[pos:m.start()]))
        kind = m.lastgroup
        text = m.group()
        if kind == "id":
            out.append((classify(text, src, m.end()), text))
        elif kind == "block" or kind == "line":
            out.append(("cm", text))
        elif kind == "pp":
            out.append(("pp", text))
        elif kind == "str" or kind == "chr":
            out.append(("st", text))
        else:  # num
            out.append(("nu", text))
        pos = m.end()
    if pos < len(src):
        out.append(("", src[pos:]))
    return out


def to_rows(tokens):
    """按行切分，返回每行的 HTML 片段列表（跨行 token 会在每行重新包 span）。"""
    lines = [[]]
    for cls, text in tokens:
        parts = text.split("\n")
        for i, part in enumerate(parts):
            if i:
                lines.append([])
            if not part:
                continue
            esc = html.escape(part, quote=False)
            lines[-1].append(f'<span class="{cls}">{esc}</span>' if cls else esc)
    return ["".join(parts) for parts in lines]


CSS = """
* { box-sizing: border-box; }
html, body { margin: 0; padding: 0; }
body {
  width: %(width)dpx;
  background: #121417;
  background-image: radial-gradient(1200px 600px at 10%% -10%%, #1b2130 0%%, #121417 60%%);
  color: #d7dae0;
  font-family: "Microsoft YaHei UI", "Microsoft YaHei", "Segoe UI", sans-serif;
  padding: 28px 30px 34px;
  -webkit-font-smoothing: antialiased;
}
.hd { margin: 0 0 18px 4px; }
.hd h1 {
  margin: 0 0 10px; font-size: 25px; line-height: 1.25; font-weight: 700;
  color: #f3f5f8; letter-spacing: .2px;
}
.hd h1 .lang {
  display: inline-block; vertical-align: 4px; margin-left: 10px;
  font: 700 12px/18px Consolas, monospace; color: #0d1117;
  background: #6cc06c; border-radius: 4px; padding: 1px 7px;
}
.hd .sub {
  font-size: 13.5px; line-height: 1.6; color: #8b93a1;
  font-family: Consolas, "Cascadia Mono", monospace;
}
.codebox {
  background: #0d0f12; border: 1px solid #262b33; border-radius: 10px;
  padding: 16px 6px 16px 0; overflow: hidden;
  box-shadow: 0 1px 0 rgba(255,255,255,.03) inset;
}
.code { margin: 0; font-family: Consolas, "Cascadia Mono", "Courier New", monospace;
        font-size: 15px; line-height: 1.62; }
.row { display: flex; }
.row .ln {
  flex: 0 0 auto; width: 58px; padding-right: 18px; text-align: right;
  color: #454c5a; user-select: none;
}
.row .src { flex: 1 1 auto; white-space: pre; color: #c8cdd7; }
.row:hover { background: #13161b; }
.kw  { color: #c678dd; }
.ty  { color: #e5c07b; }
.fn  { color: #61afef; }
.mac { color: #d19a66; }
.st  { color: #98c379; }
.nu  { color: #d19a66; }
.cm  { color: #7d8794; font-style: italic; }
.pp  { color: #56b6c2; }
.notes {
  margin-top: 22px; background: #151920; border: 1px solid #262b33;
  border-left: 3px solid #6cc06c; border-radius: 8px; padding: 16px 22px 14px;
}
.notes h2 {
  margin: 0 0 10px; font-size: 15px; font-weight: 700; color: #9ad07a;
  letter-spacing: 1px;
}
.notes ul { margin: 0; padding-left: 22px; }
.notes li { font-size: 13.5px; line-height: 1.85; color: #b6bdc9; }
.notes code {
  font-family: Consolas, monospace; font-size: 13px;
  background: #1d222b; color: #e5c07b; border-radius: 4px; padding: 1px 5px;
}
"""

HTML = """<!doctype html>
<html lang="zh-CN"><head><meta charset="utf-8"><title>0</title>
<style>%(css)s</style></head>
<body>
  <div class="hd">
    <h1>%(title)s<span class="lang">C</span></h1>
    <div class="sub">%(subtitle)s</div>
  </div>
  <div class="codebox"><div class="code">
%(rows)s
  </div></div>
%(notes)s
<script>
  function h() {
    var a = document.body.scrollHeight, b = document.documentElement.scrollHeight;
    document.title = String(Math.ceil(Math.max(a, b)));
  }
  window.addEventListener("load", h);
  h();
</script>
</body></html>
"""


def build_html(path, width, title, subtitle, notes):
    with open(path, "r", encoding="utf-8") as f:
        src = f.read()
    rows = to_rows(highlight(src.rstrip("\n")))
    body = []
    for i, r in enumerate(rows, 1):
        body.append(f'<div class="row"><span class="ln">{i}</span>'
                    f'<span class="src">{r or " "}</span></div>')

    notes_html = ""
    if notes:
        items = "\n".join(f"<li>{n}</li>" for n in notes)
        notes_html = ('<div class="notes"><h2>要点</h2><ul>\n'
                      + items + "\n</ul></div>")

    return HTML % dict(
        css=CSS % dict(width=width),
        title=html.escape(title),
        subtitle=html.escape(subtitle),
        rows="\n".join(body),
        notes=notes_html,
    )


def find_browser() -> str:
    cands = [
        r"C:\Program Files\Google\Chrome\Application\chrome.exe",
        r"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
        r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
        r"C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    ]
    for c in cands:
        if os.path.exists(c):
            return c
    sys.exit("找不到 Chrome/Edge，请用 --browser 指定可执行文件")


def run_browser(exe, url, extra, profile):
    cmd = [exe, "--headless=new", "--disable-gpu", "--hide-scrollbars",
           "--no-first-run", "--no-default-browser-check",
           f"--user-data-dir={profile}", *extra, url]
    return subprocess.run(cmd, capture_output=True, text=True,
                          encoding="utf-8", errors="replace", timeout=180)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--src", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--title", default="代码注释版")
    ap.add_argument("--subtitle", default="")
    ap.add_argument("--note", action="append", default=[])
    ap.add_argument("--width", type=int, default=1100)
    ap.add_argument("--scale", type=int, default=2)
    ap.add_argument("--browser", default=None)
    args = ap.parse_args()

    html_text = build_html(args.src, args.width, args.title, args.subtitle,
                           args.note)
    tmp_dir = tempfile.mkdtemp(prefix="codepng_")
    page = os.path.join(tmp_dir, "page.html")
    with open(page, "w", encoding="utf-8") as f:
        f.write(html_text)

    exe = args.browser or find_browser()
    url = "file:///" + page.replace("\\", "/")
    profile = os.path.join(tmp_dir, "profile")

    # 1) 量高度
    dump = run_browser(exe, url, ["--virtual-time-budget=4000", "--dump-dom"], profile)
    m = re.search(r"<title>(\d+)</title>", dump.stdout or "")
    if not m:
        sys.exit("测量页面高度失败:\n" + (dump.stderr or dump.stdout)[:2000])
    height = int(m.group(1)) + 2

    # 2) 截图
    out_abs = os.path.abspath(args.out)
    shot = run_browser(
        exe, url,
        ["--virtual-time-budget=4000", f"--force-device-scale-factor={args.scale}",
         f"--window-size={args.width},{height}", f"--screenshot={out_abs}"],
        os.path.join(tmp_dir, "profile2"),
    )
    if not os.path.exists(out_abs):
        sys.exit("截图失败:\n" + (shot.stderr or shot.stdout)[:2000])
    print(f"OK  {out_abs}  ({args.width}*{height} css -> "
          f"{args.width * args.scale}*{height * args.scale} px)")


if __name__ == "__main__":
    main()
