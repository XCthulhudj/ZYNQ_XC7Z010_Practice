#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""HTML -> PDF（用本机 Chrome/Edge 的 headless 打印，无第三方依赖）。

用法：
    python Tools/html_to_pdf.py Docs/ps_uart_irq_reference.html
    python Tools/html_to_pdf.py in.html -o out.pdf --paper A4 --margin 15,14
"""

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile


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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src")
    ap.add_argument("-o", "--out", default=None)
    ap.add_argument("--browser", default=None)
    ap.add_argument("--timeout", type=int, default=180)
    args = ap.parse_args()

    src = os.path.abspath(args.src)
    if not os.path.exists(src):
        sys.exit(f"找不到输入文件：{src}")
    out = os.path.abspath(args.out or os.path.splitext(src)[0] + ".pdf")

    tmp = tempfile.mkdtemp(prefix="html2pdf_")
    profile = os.path.join(tmp, "profile")
    # 复制到临时目录，避免 file:// 相对资源/权限问题
    local = os.path.join(tmp, os.path.basename(src))
    shutil.copyfile(src, local)
    url = "file:///" + local.replace("\\", "/")

    cmd = [
        args.browser or find_browser(),
        "--headless=new", "--disable-gpu", "--no-first-run",
        "--no-default-browser-check", f"--user-data-dir={profile}",
        "--virtual-time-budget=6000",
        "--no-pdf-header-footer",
        f"--print-to-pdf={out}",
        url,
    ]
    r = subprocess.run(cmd, capture_output=True, text=True,
                       encoding="utf-8", errors="replace", timeout=args.timeout)
    if not os.path.exists(out):
        sys.exit("打印失败:\n" + (r.stderr or r.stdout)[:2000])

    with open(out, "rb") as f:
        head = f.read(4096)
    pages = None
    try:
        with open(out, "rb") as f:
            raw = f.read()
        m = re.search(rb"/Count\s+(\d+)", raw)
        if m:
            pages = int(m.group(1))
    except Exception:
        raw = b""
    print(f"OK  {out}  {os.path.getsize(out)} bytes"
          + (f"  ~{pages} 页" if pages else "")
          + ("  (PDF)" if head.startswith(b"%PDF") else "  (警告：不是 PDF?)"))


if __name__ == "__main__":
    main()
