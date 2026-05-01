$ErrorActionPreference = 'Stop'

$url = 'http://cfhcable.dl.sourceforge.net/project/gretl/gretl/2026b/gretl-2026b-32.exe?viasf=1&fid=4945960760fc51cd'
$url64 = 'http://pilotfiber.dl.sourceforge.net/project/gretl/gretl/2026b/gretl-2026b-64.exe?viasf=1&fid=38c2d405e4c4ee8e'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '9f7638bd5a02a5e5400b0319ec9772aad4bfa4857e50cc653c56f0e7675afd42'
  checksumType   = 'sha256'
  checksum64     = '236d0079cca4475023dd6ec665de5f6689e918adca795cf73ac146a1d5aa7dc3'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
