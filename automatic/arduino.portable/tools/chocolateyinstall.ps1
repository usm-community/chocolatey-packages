$ErrorActionPreference = 'Stop'

$url64 = 'https://github.com/arduino/arduino-ide/releases/download/2.3.7/arduino-ide_2.3.7_Windows_64bit.zip'
$version = '2.3.7'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$($env:ProgramFiles)\Arduino IDE"
  url64          = $url64
  checksum64     = '06ce437eb10653c4c65ac8d3fd559e89e8d262afb75d5be42bbacb92887f4c6c'
  checksumType64 = 'sha256'
}

$ExeLocation = Join-Path $($packageArgs.unzipLocation) "Arduino IDE.exe"

#Create Firewall rule
New-NetFirewallRule -DisplayName "Arduino IDE" -Direction Inbound -Program $ExeLocation -Action Allow

Install-ChocolateyZipPackage @packageArgs

#Create Shortcut
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arduino IDE.lnk" -TargetPath $ExeLocation
