$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = 'D7E092D32251BC1BE31D73BE795EA05213DE2DC039A1DC68DF85E987C8BFB7E9'
  checksumType64 = 'sha256'
  silentArgs     = "/allusers /S"
}

Install-ChocolateyPackage @packageArgs
