$ErrorActionPreference = 'Stop'

$url = 'https://prdownloads.sourceforge.net/gretl/gretl-2023c-32.exe'
$url64 = 'https://prdownloads.sourceforge.net/gretl/gretl-2023c-64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  softwareName   = 'gretl*'
  checksum       = '13aa1c8258d5bf23b9304745e8b4c54b520b3e08966fae7bb60876b0e81f7a3f'
  checksumType   = 'sha256'
  checksum64     = '59da70abf6c2bf6ce96ad87f8412a0c5c8f3ddeefe60adb2e9723d15223c5898'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
