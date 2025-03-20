$ErrorActionPreference = 'Stop';
$version = '1.13'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = '9d0410f87927e83545b227ef10fa4eeb227561513cb03551a394a4d3975e588a'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs