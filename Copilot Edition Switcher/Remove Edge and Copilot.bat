@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Right-click and "Run as administrator".
    pause
    exit /b
)
echo Removing Copilot...
powershell -Command "Get-AppxPackage Microsoft.Copilot | Remove-AppxPackage"
echo Removing Edge...
taskkill /f /im msedge.exe
)
taskkill /f /im msedge.exe
del /q /s C:\Program Files (x86)\Microsoft\Edge
del /q /s C:\Program Files (x86)\Microsoft\EdgeUpdate
del /q /s C:\Program Files (x86)\Microsoft\Temp
cmd
