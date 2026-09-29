@echo off
chcp 65001 >nul
title 以 Google Chrome 開啟平臺
echo ======================================================================
echo    正在使用 Google Chrome 開啟社會案件統計與視覺化地圖平臺...
echo ======================================================================
echo.

if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto ok
)
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
    start "" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto ok
)
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" (
    start "" "%LocalAppData%\Google\Chrome\Application\chrome.exe" "%~dp0index.html"
    goto ok
)

echo 未在標準路徑找到 Chrome，嘗試以 chrome 指令啟動...
start chrome "%~dp0index.html" 2>nul
if %ERRORLEVEL% EQU 0 goto ok

echo 若未自動開啟，正在為您使用系統預設瀏覽器開啟 index.html...
start "" "%~dp0index.html"

:ok
echo [✓] 已發送開啟指令！
timeout /t 3 >nul
