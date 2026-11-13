$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/GoldenCheetah/GoldenCheetah/releases/download/v3.8/GoldenCheetah_v3.8_x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'goldencheetah*'
  checksum64     = '7aae10c26f67698a690505ec0b3011f7c8e6b7a12cd5026f8a175579b4598c58'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
