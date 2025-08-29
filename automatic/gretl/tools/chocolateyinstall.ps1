$ErrorActionPreference = 'Stop'

$url = 'https://prdownloads.sourceforge.net/gretl/gretl-2025a-32.exe'
$url64 = 'https://prdownloads.sourceforge.net/gretl/gretl-2025a-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '9ebcbdf729792b3ff368bbac76b92b3263332e5bafcae8cef9da9f59f4f45f97'
  checksumType   = 'sha256'
  checksum64     = '0be6fa95a1a62984e730ae6334adaf6bbc4effd4a795e62505056dc2288a1fb5'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
