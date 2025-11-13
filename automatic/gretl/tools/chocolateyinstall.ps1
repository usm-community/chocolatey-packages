$ErrorActionPreference = 'Stop'

$url = 'http://phoenixnap.dl.sourceforge.net/project/gretl/gretl/2025c/gretl-2025c-32.exe?viasf=1'
$url64 = 'http://psychz.dl.sourceforge.net/project/gretl/gretl/2025c/gretl-2025c-64.exe?viasf=1'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '327aac98c3a60f0ab5e4f58eb363e42b3595184fced546a51632ca57be634e28'
  checksumType   = 'sha256'
  checksum64     = '6e50af8b9ec003169f9fd3369280120bb41d81807b1b006ed65bfdbfb802dfeb'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
