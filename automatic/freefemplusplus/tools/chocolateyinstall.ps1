$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/FreeFem/FreeFem-sources/releases/download/v4.11/FreeFEM-4.11-win64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'freefem*'
  checksum64     = '5110e72d373bf95b4b87530357fb844a32f5b7ce7ddcc93b4e1dcf96da6194b9'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
