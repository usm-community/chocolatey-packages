$ErrorActionPreference = 'Stop';
$version = '1.14'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = '9e65bc76a68bc782d8cd04d65211071b99eb0b90c0d71bc1c4ce26bf79029f32'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs