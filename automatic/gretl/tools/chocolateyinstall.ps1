$ErrorActionPreference = 'Stop'

$url = 'http://cytranet.dl.sourceforge.net/project/gretl/gretl/2026d/gretl-2026d-32.exe?viasf=1&fid=fd8f95a98ef9fd6b&e=1793418174&st=657vF7i5bmY7t5OcyjON_g'
$url64 = 'http://psychz.dl.sourceforge.net/project/gretl/gretl/2026d/gretl-2026d-64.exe?viasf=1&fid=44f629ddd5edc297&e=1793418175&st=Kw11Blh0C1PyqitxtRaAYA'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '1daa5e4c415fd27e3bb9024018d4e5f744ff27c0de94031a5acf94e59a74b083'
  checksumType   = 'sha256'
  checksum64     = 'e9d70629912bf1470e7e1540f5a2c9418e9afcbfb1c62b57830c913ac176c716'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
