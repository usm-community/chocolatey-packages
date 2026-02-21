$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = '56AACE0AD3AC1B12AC622E7D755A6BD5BB581D0FF3CFE53E369C9355990B9CC6'
  checksumType64 = 'sha256'
  silentArgs     = "/allusers /S"
}

Install-ChocolateyPackage @packageArgs
