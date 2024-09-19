$ErrorActionPreference = 'Stop'
$InstallDir = "$($env:ProgramFiles)\Arduino IDE"
$ShortcutPath = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk"

#Removing Install Folder
if(Test-Path $InstallDir){
    Remove-Item $InstallDir -Force -Recurse
} else {
    Write-Error "Uninstall : Installation directory not found..."
}

#Removing Firewall Rule 
if(Get-NetFirewallRule -DisplayName "Arduino IDE"){
    Remove-NetFirewallRule -DisplayName "Arduino IDE"
} else {
    Write-Error "Uninstall : Firewall rule not found..."
}


#Removing Shortcut
if(Test-Path $ShortcutPath){
    Remove-Item $ShortcutPath -Force
} else {
    Write-Error "Uninstall : Start Menu shortcut not found..."
}

