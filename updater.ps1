Write-Output "Cleaning up temp for Post-Setup..."
Remove-Item -Recurse -Force "$env:localappdata\Temp\N11\" -erroraction silentlycontinue
Remove-Item -Recurse -Force "$env:UserProfile\Desktop\post-setup-main" -erroraction silentlycontinue
Remove-Item -Recurse -Force "$env:UserProfile\Desktop\post-setup" -erroraction silentlycontinue

New-Item -ItemType Directory -Path $env:localappdata\Temp\N11\ -ErrorAction SilentlyContinue

Write-Output "Downloading Post-Setup..."
Invoke-RestMethod https://codeload.github.com/nano11-dev/post-setup/zip/refs/heads/main -OutFile "$env:localappdata\Temp\N11\N11-main.zip"

Write-Output "Downloading 7-zip CLI"
Invoke-RestMethod https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile "$env:localappdata\Temp\N11\7zxa.dll"
Invoke-RestMethod https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile "$env:localappdata\Temp\N11\7za.exe"

$zipFilePath = Join-Path "$env:localappdata\Temp\N11\" "N11-main.zip"
$extractorPath = Join-Path $env:localappdata\Temp\N11\ "7za.exe"

Write-Output "Extracting Post-Setup..."
Start-Process -FilePath $extractorPath -ArgumentList "x", $zipFilePath, "-y", "-o$env:UserProfile\Desktop\" -Wait -WindowStyle Hidden
Rename-Item "$env:UserProfile\Desktop\post-setup-main" "$env:UserProfile\Desktop\post-setup"
exit
