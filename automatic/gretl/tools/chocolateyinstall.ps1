$ErrorActionPreference = 'Stop'

$url = 'http://prdownloads.sourceforge.net/gretl/gretl-2022c-32.exe'
$url64 = 'http://prdownloads.sourceforge.net/gretl/gretl-2022c-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '591e9ec5e03fd3ecd1b066fb40578b2520f8f53674cf733dfc68ccdb4e740d1b'
  checksumType   = 'sha256'
  checksum64     = 'e0772200f4057c761bc8b211a380b566573b22fe5d7fbbca2e93e9e2847fb1ba'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
