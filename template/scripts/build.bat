@echo off
REM build.bat — 将 src 目录打包为 dist/line-insight.zip
REM
REM 平台支持：Windows 原生 CMD / PowerShell
REM macOS / Linux 以及 Windows 的 Git Bash / WSL 请改用同目录下的 build.sh
REM
REM 用法：
REM   双击本文件，或在 CMD / PowerShell 中执行 scripts\build.bat
REM
setlocal EnableDelayedExpansion

set "SCRIPT_DIR=%~dp0"
REM %~dp0 自带末尾反斜杠，拼接 ".." 得到项目根目录
set "ROOT=%SCRIPT_DIR%.."
set "SRC=%ROOT%\src"
set "DIST=%ROOT%\dist"
set "ZIP=%DIST%\line-insight.zip"

REM 准备输出目录
if not exist "%DIST%" mkdir "%DIST%"
if exist "%ZIP%" del /f /q "%ZIP%"

REM 使用系统自带 PowerShell 的 Compress-Archive 打包（.NET 原生，无需第三方工具）
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "Compress-Archive -Path (Join-Path '%SRC%' '*') -DestinationPath '%ZIP%' -Force"

if exist "%ZIP%" (
  echo 已生成 %ZIP%
) else (
  echo 打包失败，请检查 src 目录是否存在。
  exit /b 1
)

endlocal
