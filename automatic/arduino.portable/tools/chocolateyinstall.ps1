$ErrorActionPreference = 'Stop'

$url64 = 'https://github.com/arduino/arduino-ide/releases/download/2.3.10/arduino-ide_2.3.10_Windows_64bit.zip'
$version = '2.3.10'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$($env:ProgramFiles)\Arduino IDE"
  url64          = $url64
  checksum64     = '5dd9d6b2e2c9ef8dd9d98da7808f712daff97911a91d3ccfaf946355c6b6abb3'
  checksumType64 = 'sha256'
}

$ExeLocation = Join-Path $($packageArgs.unzipLocation) "Arduino IDE.exe"

#Create Firewall rule
New-NetFirewallRule -DisplayName "Arduino IDE" -Direction Inbound -Program $ExeLocation -Action Allow

Install-ChocolateyZipPackage @packageArgs

#Create Shortcut
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk" -TargetPath $ExeLocation
