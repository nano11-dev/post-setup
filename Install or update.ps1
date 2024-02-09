mkdir C:\Windows\Temp\N11\
irm https://codeload.github.com/nano11-dev/post-setup/zip/refs/heads/main -OutFile C:\Windows\Temp\N11\N11-main.zip
irm https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile C:\Windows\Temp\N11\7zxa.dll
irm https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile C:\Windows\Temp\N11\7za.exe
C:\Windows\Temp\N11\7za.exe x C:\Windows\Temp\N11\N11-main.zip -y -oc:\Users\Public\Desktop\
del /s /q "C:\users\Public\desktop\post-setup"
ren "C:\Users\Public\Desktop\post-setup-main" "C:\Users\Public\Desktop\post-setup"
cmd.exe /c rmdir c:\Windows\temp\N11\ /s /q
exit
