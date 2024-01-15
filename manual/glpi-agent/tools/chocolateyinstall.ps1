$ErrorActionPreference = 'Stop';
$version = '1.7.1'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x86.msi"
  checksum      = 'd5b6501b59a3d738da42ee7b1e2363be605ace85bc1c427aa3388decd7e4739a'
  checksumType  = 'sha256' 
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = 'e9148d85e56e030f068022e01bdf69d6c9da23b9aff3aefece4ff7c881aeca41'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs