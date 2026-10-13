$ErrorActionPreference = 'Stop'

$url = 'http://cfhcable.dl.sourceforge.net/project/gretl/gretl/2026c/gretl-2026c-32.exe?viasf=1&fid=6c7e4cc3c403eea6&e=1791953010&st=lUFesY4NdtOdAU78PGWdmA'
$url64 = 'http://psychz.dl.sourceforge.net/project/gretl/gretl/2026c/gretl-2026c-64.exe?viasf=1&fid=83fc1152170d3319&e=1791953011&st=r5V6lDQPySVwMf_ndT5tsA'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '5f68a75e32840fac0ed46f2e2711a929529a8eac66e84de194c5c093d9c98a3b'
  checksumType   = 'sha256'
  checksum64     = 'f4f08ecf43021a02a7c9c96a66e23b99983a9875b587dfd2a343bec61a34fd93'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
