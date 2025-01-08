$ErrorActionPreference = 'Stop'

$url64 = 'https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.4_Windows_64bit.zip'
$version = '2.3.4'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$($env:ProgramFiles)\Arduino IDE"
  url64          = $url64
  checksum64     = '745baef00b134a27fc8a83653261ffa1513d750568c4aa24acc4980546d6e971'
  checksumType64 = 'sha256'
}

$ExeLocation = Join-Path $($packageArgs.unzipLocation) "Arduino IDE.exe"

#Create Firewall rule
New-NetFirewallRule -DisplayName "Arduino IDE" -Direction Inbound -Program $ExeLocation -Action Allow

Install-ChocolateyZipPackage @packageArgs

#Create Shortcut
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk" -TargetPath $ExeLocation
