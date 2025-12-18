$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/GoldenCheetah/GoldenCheetah/releases/download/v3.7-SP1/GoldenCheetah_v3.7-sp1_x64Qt6.exe'

$packageArgs = @{
  packageName    = 'usm-goldencheetah'
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'goldencheetah*'
  checksum64     = 'e00d3bcea114c54b64f270b9ab467d1513207d296de85cae2bb1ac2ae25a355f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
