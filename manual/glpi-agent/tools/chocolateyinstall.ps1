$ErrorActionPreference = 'Stop';
$version = '1.7.3'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x86.msi"
  checksum      = '357a51f5c0ea8f7d844b774d2960862b0b4652fb50e1b957323a3482c3564409'
  checksumType  = 'sha256' 
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = '9914b84f72295d73cc664f0bf9e577820699c0e0a47c9cd28b71b743b2cd91c3'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs