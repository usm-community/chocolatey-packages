$ErrorActionPreference = 'Stop'

$url = 'http://prdownloads.sourceforge.net/gretl/gretl-2024d-32.exe'
$url64 = 'http://prdownloads.sourceforge.net/gretl/gretl-2024d-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = 'a305cc7b3c1d7a45828e4a6a5795ba2128fbad90c8c5a5b7d608d5024f6fb469'
  checksumType   = 'sha256'
  checksum64     = '8d3b198616c9317f201a9b3b2620632c9083e89bad619b39ee1b964650ea17b4'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
