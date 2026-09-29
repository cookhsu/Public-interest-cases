#!/bin/bash
# 社會案件統計與地區視覺化地圖平臺 - Mac / Linux 離線啟動腳本
echo "======================================================================"
echo "   社會案件統計與地區視覺化地圖平臺 (全功能離線獨立版)"
echo "======================================================================"
echo ""
echo "正在檢測本地執行環境..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if command -v python3 >/dev/null 2>&1; then
    echo "[✓] 檢測到已安裝 Python 3，正在啟動本地離線伺服器並自動開啟瀏覽器..."
    python3 local-server.py
elif command -v python >/dev/null 2>&1; then
    echo "[✓] 檢測到已安裝 Python，正在啟動本地離線伺服器並自動開啟瀏覽器..."
    python local-server.py
elif command -v open >/dev/null 2>&1; then
    echo "[✓] 正在以 macOS 預設瀏覽器開啟 index.html..."
    open index.html
elif command -v xdg-open >/dev/null 2>&1; then
    echo "[✓] 正在以 Linux 預設瀏覽器開啟 index.html..."
    xdg-open index.html
else
    echo "未檢測到自動開啟工具，請直接以現代瀏覽器 (Chrome, Edge, Firefox, Safari) 開啟目前目錄下的 index.html 即可！"
fi
