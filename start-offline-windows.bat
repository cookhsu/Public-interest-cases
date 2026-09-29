@echo off
chcp 65001 >nul
title 社會案件統計與地區視覺化地圖平臺 - 離線啟動
echo ======================================================================
echo    社會案件統計與地區視覺化地圖平臺 (全功能離線獨立版)
echo ======================================================================
echo.
echo  [資訊] 本平臺已採用 100%% 獨立單檔技術，支援各類主流瀏覽器直接開啟！
echo.
echo  正在為您啟動平臺...
echo.

:: 1. 優先嘗試使用 Google Chrome 直接開啟
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    echo  [✓] 檢測到 Google Chrome，正在以 Chrome 開啟...
    start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto end
)
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    echo  [✓] 檢測到 Google Chrome (x86)，正在以 Chrome 開啟...
    start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto end
)
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
    echo  [✓] 檢測到 Google Chrome (使用者路徑)，正在以 Chrome 開啟...
    start "" "%LocalAppData%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto end
)

:: 2. 若無 Chrome，嘗試以 Microsoft Edge 開啟
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" (
    echo  [✓] 檢測到 Microsoft Edge，正在以 Edge 開啟...
    start "" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" "%~dp0index.html"
    goto end
)

:: 3. 嘗試以 Python 啟動本地微型伺服器
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo  [✓] 正在啟動 Python 本地伺服器...
    start python local-server.py
    goto end
)

:: 4. 以系統預設瀏覽器直接開啟 index.html
echo  [✓] 正在以系統預設瀏覽器開啟...
start "" "%~dp0index.html"

:end
echo.
echo  ======================================================================
echo   平臺已成功啟動！如需離開請直接關閉此視窗或瀏覽器分頁。
echo  ======================================================================
timeout /t 5 >nul
