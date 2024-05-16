$ErrorActionPreference = 'Stop';
$version = '1.8'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  # url           = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x86.msi"
  # checksum      = ''
  # checksumType  = 'sha256' 
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = '31299f6bb8f8d21a92f40b9da5680bd009e8d80e24485d11ce4aa940c1f07c71'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs