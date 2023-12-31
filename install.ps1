mkdir C:\Windows\Temp\N11\
mkdir C:\Users\Public\Desktop\Post-Setup
irm https://codeload.github.com/nano11-dev/post-setup/zip/refs/heads/main -OutFile C:\Windows\Temp\N11\N11-main.zip
irm https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile C:\Windows\Temp\N11\7zxa.dll
irm https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile C:\Windows\Temp\N11\7za.exe
C:\Windows\Temp\N11\7za.exe e C:\Windows\Temp\N11\N11-main.zip -y -oc:C:\Users\Public\Desktop\Post-Setup\N11\
rmdir C:\Windows\Temp\N11\ /s /q
