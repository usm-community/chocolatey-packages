$ErrorActionPreference = 'Stop'

$url = 'http://prdownloads.sourceforge.net/gretl/gretl-2025b-32.exe'
$url64 = 'http://prdownloads.sourceforge.net/gretl/gretl-2025b-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = ''
  checksumType   = ''
  checksum64     = ''
  checksumType64 = ''
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
