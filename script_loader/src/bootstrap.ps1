## Create a test file to shoow variable is used
Write-host "Writing test file"
New-Item -Path "c:\${filename}.txt"

#Set Windows Firewall to OFF
write-host "Setting Windows Firewall to OFF..."
set-NetFirewallProfile -All -Enabled False

#Install CHOCO
write-host "Installing CHOCO..."
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Refresh Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

Write-Host "Install APPS via Choco"
#Install GIT
choco install -y git -params '"/GitOnlyOnPath"'
$env:Path += ";$env:ProgramFiles\Git\cmd"

#what to install
choco install -y googlechrome vscode 7zip notepadplusplus putty

#Clear userdata
write-host "Clear userdata"
set-location "$env:ProgramFiles\VMware\VMware~1\"
.\rpctool.exe "info-set guestinfo.userdata  "

#Remove Script
write-host "Remove Script"
Remove-Item -Path "C:\bootstrap.ps1" -Force
#Restart VM
write-host "Restart VM"
Restart-Computer -Force
