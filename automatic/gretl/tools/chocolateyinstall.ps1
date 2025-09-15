$ErrorActionPreference = 'Stop'

$url = 'http://netix.dl.sourceforge.net/project/gretl/gretl/2025b/gretl-2025b-32.exe?viasf=1'
$url64 = 'http://deac-riga.dl.sourceforge.net/project/gretl/gretl/2025b/gretl-2025b-64.exe?viasf=1'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '383dc045cf5ac0309beef82d1e70e476587a42ad3bd1d8923d85970d37da7b2e'
  checksumType   = 'sha256'
  checksum64     = '01d0ff70f00e57c1d4045d0eb0bdf98ad524755db2e561a8bef7dbc0c3aee629'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
