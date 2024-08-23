$ErrorActionPreference = 'Stop'

$url = 'https://prdownloads.sourceforge.net/gretl/gretl-2024b-32.exe'
$url64 = 'https://prdownloads.sourceforge.net/gretl/gretl-2024b-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = 'e3bffb65f2bf720a18bede079c9d48533482be06fd3a40e153cd06a719dc421e'
  checksumType   = 'sha256'
  checksum64     = 'd3108106b8b5fb242ecc2e88f79411dc93226e6cc1e3058738529076a30bca1a'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
