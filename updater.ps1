Write-Output "Checking for administrator permissions..."
# Get the ID and security principal of the current user account
$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

# Get the security principal for the Administrator role
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

# Check to see if we are currently running "as Administrator"
if ($myWindowsPrincipal.IsInRole($adminRole))
   {
   Write-Output "The script is running as administrator. Can continue"
   }
else
   {
   # We are not running "as Administrator" - so relaunch as administrator

   # Create a new process object that starts PowerShell
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

   # Specify the current script path and name as a parameter
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;

   # Indicate that the process should be elevated
   $newProcess.Verb = "runas";

   # Start the new process
   [System.Diagnostics.Process]::Start($newProcess);

   # Exit from the current, unelevated, process
   exit
   }


Write-Output "Cleaning up temp for Post-Setup..."
Remove-Item -Recurse -Force "$env:localappdata\Temp\N11\" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\post-setup-main" -erroraction silentlycontinue
Remove-Item -Recurse -Force "C:\Users\Public\Desktop\post-setup" -erroraction silentlycontinue

New-Item -ItemType Directory -Path $env:localappdata\Temp\N11\ -ErrorAction SilentlyContinue

Write-Output "Downloading Post-Setup..."
Invoke-RestMethod https://codeload.github.com/nano11-dev/post-setup/zip/refs/heads/main -OutFile "$env:localappdata\Temp\N11\N11-main.zip"

Write-Output "Downloading 7-zip CLI"
Invoke-RestMethod https://raw.githubusercontent.com/BunnyRabbit12/N11-post-setup/BIN/7zxa.dll -OutFile "$env:localappdata\Temp\N11\7zxa.dll"
Invoke-RestMethod https://github.com/BunnyRabbit12/N11-post-setup/raw/BIN/7za.exe -OutFile "$env:localappdata\Temp\N11\7za.exe"

$zipFilePath = Join-Path "$env:localappdata\Temp\N11\" "N11-main.zip"
$extractorPath = Join-Path $env:localappdata\Temp\N11\ "7za.exe"

Write-Output "Extracting Post-Setup..."
Start-Process -FilePath $extractorPath -ArgumentList "x", $zipFilePath, "-y", "-oC:\Users\Public\Desktop\" -Wait -WindowStyle Hidden
Rename-Item "C:\Users\Public\Desktop\post-setup-main" "C:\Users\Public\Desktop\post-setup"

exit