@echo off
REM Quick single-file build: Cocos web-mobile build + inline -> dist\index.html
REM Double-click this file, or run `build` from a terminal in the project root.

setlocal
cd /d "%~dp0"

powershell -NoProfile -ExecutionPolicy Bypass -File "tools\build.ps1" %*
set "RC=%ERRORLEVEL%"

echo.
if "%RC%"=="0" (
    echo [OK] Build finished. Single-file: dist\index.html
) else (
    echo [FAIL] Build failed with exit code %RC%.
)

REM Pause only when launched by double-click (keeps window open to read output).
REM When run from an existing console, %CMDCMDLINE% contains the script name.
echo %CMDCMDLINE% | find /i "%~nx0" >nul && pause
exit /b %RC%
