$ErrorActionPreference = 'Stop'

$url64 = 'https://github.com/arduino/arduino-ide/releases/download/2.3.11/arduino-ide_2.3.11_Windows_64bit.zip'
$version = '2.3.11'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$($env:ProgramFiles)\Arduino IDE"
  url64          = $url64
  checksum64     = 'c52f6bb6ae8ca511875d28b76d552c835a2f8c4dc0ef823614e0a107021a0544'
  checksumType64 = 'sha256'
}

$ExeLocation = Join-Path $($packageArgs.unzipLocation) "Arduino IDE.exe"

#Create Firewall rule
New-NetFirewallRule -DisplayName "Arduino IDE" -Direction Inbound -Program $ExeLocation -Action Allow

Install-ChocolateyZipPackage @packageArgs

#Create Shortcut
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk" -TargetPath $ExeLocation
