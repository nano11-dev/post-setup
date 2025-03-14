@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Right-click and "Run as administrator".
    pause
    exit /b
)
echo Removing Copilot...
powershell
Microsoft.Copilot | Remove-AppxPackage
echo Removing Edge...
taskkill /f /im msedge.exe
for /d %%I in ("C:\Program Files (x86)\Microsoft\Edge\Application\*") do set EdgeVersion=%%~nxI
if not exist "C:\Program Files (x86)\Microsoft\Edge\Application\%EdgeVersion%\Installer\setup.exe" (
    echo Microsoft Edge is not installed or cannot be found.
    pause
    exit /b
)
"C:\Program Files (x86)\Microsoft\Edge\Application\%EdgeVersion%\Installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall
taskkill /f /im msedge.exe
del /q /s C:\Program Files (x86)\Microsoft\Edge
del /q /s C:\Program Files (x86)\Microsoft\EdgeUpdate
del /q /s C:\Program Files (x86)\Microsoft\Temp
cmd
