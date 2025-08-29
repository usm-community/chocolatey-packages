$ErrorActionPreference = 'Stop';
$url = 'http://jeanmarie.biansan.free.fr/telechargement/lazarus/optgeo/3.03/installateuroptgeo_3.03.exe'

$packageArgs = @{
  packageName  = $packageName
  softwareName = 'optgeo*'
  fileType     = 'exe'
  url          = $url
  checksum     = '8a18aa72a7e028a23edc7f37ab81aa7ce774d2cb64a869cdc12b1cc82f4ce9ac'
  checksumType = 'sha256'
  silentArgs   = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @packageArgs

Remove-Item -Path "$env:Temp\$packageName" -Recurse -Force

