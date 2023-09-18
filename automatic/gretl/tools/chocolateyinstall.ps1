$ErrorActionPreference = 'Stop'

$url = 'https://prdownloads.sourceforge.net/gretl/gretl-2023b-32.exe'
$url64 = 'https://prdownloads.sourceforge.net/gretl/gretl-2023b-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '2b40db56618b7fd7cbedf5e6e365a0594d5930efe4c64cf952dc1350b5dceeb3'
  checksumType   = 'sha256'
  checksum64     = 'd7bef2c2466ed7c462919727c212010dd1ee6f3eb6e489273530ab8ce7720216'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
