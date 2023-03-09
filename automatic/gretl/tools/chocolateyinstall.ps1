$ErrorActionPreference = 'Stop'

$url = 'http://prdownloads.sourceforge.net/gretl/gretl-2023a-32.exe'
$url64 = 'http://prdownloads.sourceforge.net/gretl/gretl-2023a-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = 'e78c6c4c63de336ab7757f9522690ef1d3e55cd82366c8722beaf4d940cc0c2d'
  checksumType   = 'sha256'
  checksum64     = 'ceb8963d2caeb1ffaba3fbbcfce1c1f011183c26c2e1f72a8ed0f4cf59c69c9e'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
