$ErrorActionPreference = 'Stop'

$url64 = 'https://github.com/arduino/arduino-ide/releases/download/2.3.8/arduino-ide_2.3.8_Windows_64bit.zip'
$version = '2.3.8'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$($env:ProgramFiles)\Arduino IDE"
  url64          = $url64
  checksum64     = '17879b5550b659b46cfe6b788d2f15428246c24e7dabed4826bb225cfeb27665'
  checksumType64 = 'sha256'
}

$ExeLocation = Join-Path $($packageArgs.unzipLocation) "Arduino IDE.exe"

#Create Firewall rule
New-NetFirewallRule -DisplayName "Arduino IDE" -Direction Inbound -Program $ExeLocation -Action Allow

Install-ChocolateyZipPackage @packageArgs

#Create Shortcut
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk" -TargetPath $ExeLocation
