$ErrorActionPreference = 'Stop'

$url = 'http://prdownloads.sourceforge.net/gretl/gretl-2025b-32.exe'
$url64 = 'http://prdownloads.sourceforge.net/gretl/gretl-2025b-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '332ba87d79af116242e9e44a6a8ccefed9cdad2a57755aa774d5f3198120179a'
  checksumType   = 'sha256'
  checksum64     = 'c128dd29e395e05a11fcb05da130186e71998d8f5e83ec5ac0464fe2de511715'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
