$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = '83E7C30BB82BA5CC3A41A4C330A90B8D4BF15692442413FD1C79E8AD9A9EE432'
  checksumType64 = 'sha256'
  silentArgs     = "/allusers /S"
}

Install-ChocolateyPackage @packageArgs
