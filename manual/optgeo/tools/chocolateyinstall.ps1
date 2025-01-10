$ErrorActionPreference = 'Stop';
$url = 'http://jeanmarie.biansan.free.fr/telechargement/lazarus/optgeo/3.00/installateuroptgeo_3.00.exe'

$packageArgs = @{
  packageName  = $packageName
  softwareName = 'optgeo*'
  fileType     = 'exe'
  url          = $url
  checksum     = 'EE5AC3A07D41F79522F0068C5DCB76882BFCBC00A23C42ACCD50130C790A75C9'
  checksumType = 'sha256'
  silentArgs   = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @packageArgs

Remove-Item -Path "$env:Temp\$packageName" -Recurse -Force

