Write-Output "Cleaning up temp for Extras..."
Remove-Item -Recurse -Force "$env:localappdata\Temp\N11-extras\" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\extras-main" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\extras" -erroraction silentlycontinue

New-Item -ItemType Directory -Path $env:localappdata\Temp\N11-extras\ -ErrorAction SilentlyContinue

Write-Output "Downloading Extras..."
Invoke-RestMethod https://codeload.github.com/nano11-dev/extras/zip/refs/heads/main -OutFile "$env:localappdata\Temp\N11\N11-main.zip"

Write-Output "Downloading 7-zip CLI"
Invoke-RestMethod https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile "$env:localappdata\Temp\N11\7zxa.dll"
Invoke-RestMethod https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile "$env:localappdata\Temp\N11\7za.exe"

$zipFilePath = Join-Path "$env:localappdata\Temp\N11\" "N11-main.zip"
$extractorPath = Join-Path $env:localappdata\Temp\N11\ "7za.exe"

Write-Output "Extracting Extras..."
Start-Process -FilePath $extractorPath -ArgumentList "x", $zipFilePath, "-y", "-oC:\Users\Public\Desktop\" -Wait -WindowStyle Hidden
Rename-Item "C:\Users\Public\Desktop\extras-mainn" "C:\Users\Public\Desktop\extras"

exit
