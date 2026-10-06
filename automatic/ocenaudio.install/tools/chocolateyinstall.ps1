$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = '966DE398520B4172600FBD84E9F9915345DB095C32273462C1E34FD265AD8796'
  checksumType64 = 'sha256'
  silentArgs     = "/allusers /S"
}

Install-ChocolateyPackage @packageArgs
