$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/1.15/GLPI-Agent-1.15-x64.msi"
  checksum64    = '7a5c1ed8a53ac3b85c80d25c9105030354c3fd6988793d20841a216ba2c965bb'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs