$ErrorActionPreference = 'Stop'

$url = 'http://psychz.dl.sourceforge.net/project/gretl/gretl/2026a/gretl-2026a-32.exe?viasf=1'
$url64 = 'http://cfhcable.dl.sourceforge.net/project/gretl/gretl/2026a/gretl-2026a-64.exe?viasf=1'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = 'be1870be534a2852e58ee9bea9cd6b3e233ddc3afc9ac69eba76b4ab18b7ada3'
  checksumType   = 'sha256'
  checksum64     = '80b3172fa3c067fc9b64fcb020002af0fc6427541f8ca1e43f70157f0257ed16'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
