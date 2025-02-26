$ErrorActionPreference = 'Stop';
$url = 'http://jeanmarie.biansan.free.fr/telechargement/lazarus/optgeo/3.01/installateuroptgeo_3.01.exe'

$packageArgs = @{
  packageName  = $packageName
  softwareName = 'optgeo*'
  fileType     = 'exe'
  url          = $url
  checksum     = '240c5a21bdcce5687fa79f950ba8be37c870193cdefe1b41413ade9652aa0013'
  checksumType = 'sha256'
  silentArgs   = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @packageArgs

Remove-Item -Path "$env:Temp\$packageName" -Recurse -Force

