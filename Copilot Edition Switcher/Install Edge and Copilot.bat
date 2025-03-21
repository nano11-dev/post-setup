@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Right-click and "Run as administrator".
    pause
    exit /b
)
echo Installing Microsoft Edge...
winget install "Microsoft Edge Browser" --accept-package-agreements --accept-source-agreements
if %errorLevel% neq 0 (
    echo Failed to install Microsoft Edge.
) else (
    echo Microsoft Edge installed successfully.
)
echo Installing Microsoft Copilot...
winget install "Microsoft Copilot" -s msstore
if %errorLevel% neq 0 (
    echo Failed to install Microsoft Copilot or not available in Winget.
) else (
    echo Microsoft Copilot installed successfully.
)

echo Installation completed.
pause
exit
