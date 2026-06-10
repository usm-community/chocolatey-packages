$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/FreeFem/FreeFem-sources/releases/download/v4.16/FreeFEM-4.16-amd64-win64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'freefem*'
  checksum64     = '38df81255bbff05e12dc88142dae5ca01cc20d8654edcf0530a82fff81268f95'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
