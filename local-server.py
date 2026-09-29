#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
社會案件統計與地區視覺化地圖平臺 - 本地離線 HTTP 伺服器
此腳本為純 Python 3 內建模組，無須安裝額外依賴即可在斷網環境下提供完備的本地 HTTP 伺服器服務。
"""
import http.server
import socketserver
import webbrowser
import os
import sys

DEFAULT_PORT = 8080
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

class QuietHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)

    def log_message(self, format, *args):
        # 簡易日誌，保持介面簡潔
        sys.stderr.write(f"[{self.log_date_time_string()}] {args[0]} - {args[1]}\n")

def main():
    os.chdir(DIRECTORY)
    port = DEFAULT_PORT
    server = None

    for attempt in range(20):
        try:
            server = socketserver.TCPServer(("", port), QuietHandler)
            break
        except OSError:
            port += 1

    if not server:
        print("[錯誤] 無法取得可用的本機端口，請手動開啟 index.html。")
        sys.exit(1)

    url = f"http://localhost:{port}"
    print("======================================================================")
    print("   社會案件統計與地區視覺化地圖平臺 (全功能離線獨立版)")
    print("======================================================================")
    print(f" [狀態] 本地離線伺服器已就緒！")
    print(f" [位址] {url}")
    print(f" [提示] 正在自動為您開啟瀏覽器...")
    print(f" [提示] 若欲停止本地伺服器，請按鍵盤 Ctrl + C")
    print("======================================================================")

    try:
        webbrowser.open(url)
    except Exception:
        pass

    try:
        with server:
            server.serve_forever()
    except KeyboardInterrupt:
        print("\n[結束] 本地伺服器已關閉。")
        sys.exit(0)

if __name__ == '__main__':
    main()
