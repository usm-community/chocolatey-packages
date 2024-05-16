$ErrorActionPreference = 'Stop'

$url = 'https://prdownloads.sourceforge.net/gretl/gretl-2024a-32.exe'
$url64 = 'https://prdownloads.sourceforge.net/gretl/gretl-2024a-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '484f275da535b7a99fd921d6362e3ed6201505efcec6123a4276f12904a231e5'
  checksumType   = 'sha256'
  checksum64     = '73235825e4c38b84ab786a264fa7a8e8fbdb2eb902eb604640ee9b4029607610'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
