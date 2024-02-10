Write-Output "Cleaning up temp for Post-Setup..."
Remove-Item -Recurse -Force "$env:localappdata\Temp\N11\*" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\post-setup-main" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\post-setup" -erroraction silentlycontinue

Write-Output "Downloading Post-Setup..."
irm https://codeload.github.com/nano11-dev/post-setup/zip/refs/heads/main -OutFile "$env:localappdata\Temp\N11\N11-main.zip"

Write-Output "Downloading 7zxa"
irm https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile "$env:localappdata\Temp\N11\7zxa.dll"
irm https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile "$env:localappdata\Temp\N11\7za.exe"

Write-Output "Extracting Post-Setup..."
# Define paths
$zipFilePath = Join-Path $env:localappdata\N11\ "N11-main.zip"
$extractPath = "C:\Users\Public\Desktop\"
$extractorPath = Join-Path $env:localappdata\N11\ "7zxa.exe"

# Check if 7zxa.exe exists
if (Test-Path $extractorPath -and Test-Path $zipFilePath) {
    # Execute 7zxa.exe to extract the zip file
    Start-Process -FilePath $extractorPath -ArgumentList "e", $zipFilePath, "-o$extractPath" -Wait

    Write-Host "Extraction complete. Files are located in: $extractPath"
} else {
    Write-Host "Error: 7zxa.exe or zip file not found. Please ensure they exist at the specified paths."
}

ls $env:localappdata\Temp\N11\

Start-Process -FilePath $extractor -ArgumentList "x","$env:localappdata\N11\N11-main.zip","-y","-oc:\Users\Public\Desktop\"

ls "C:\Users\Public\Desktop\"

Write-Output "Moving Post-Setup..."
ren "C:\Users\Public\Desktop\post-setup-main" "C:\Users\Public\Desktop\post-setup"
exit
