$ErrorActionPreference = 'Stop';
$version = '1.7.2'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x86.msi"
  checksum      = 'db492b326a54d110d4c85023591e4a1ea50b1ba273c9f6564a18aaefb5f4251d'
  checksumType  = 'sha256' 
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = '5e98c774151253cebf0070cd9a052138a8385255a1ff6c28eb44541a0a85e2c9'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs