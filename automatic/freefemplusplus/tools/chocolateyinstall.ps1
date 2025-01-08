$ErrorActionPreference = 'Stop'
$url64 = 'https://github.com/FreeFem/FreeFem-sources/releases/download/v4.15/FreeFem%2B%2B-4.15-win64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'freefem*'
  checksum64     = 'e72f2274d2971e41c94f13c30ae692f6f7842de3c7310144daa4276193d40195'
  checksumType64 = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
