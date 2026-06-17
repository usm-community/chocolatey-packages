$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v0.4.0-beta.6/MQTT-Explorer-Setup-0.4.0-beta.6.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  softwareName  = 'MQTT Explorer'
  checksum      = 'D6959A2A37CFCB261E608D5C2890CEFEE9DBCBFB208C9F1691F63C3B17F0AF24'
  checksumType  = 'sha256'
  validExitCodes= @(0)
  silentArgs = '/S /D="C:\Program Files\MQTT"'
}

Install-ChocolateyPackage @packageArgs