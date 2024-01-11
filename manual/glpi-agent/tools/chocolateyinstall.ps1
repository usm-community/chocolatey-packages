$ErrorActionPreference = 'Stop';
$version = '1.7'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x86.msi"
  checksum      = 'be498f48350c091de1d5b70dc203b5e01b0b9e0eaa7923601ea0ddd8d333dd33'
  checksumType  = 'sha256' 
  url64         = "https://github.com/glpi-project/glpi-agent/releases/download/$version/GLPI-Agent-$version-x64.msi"
  checksum64    = 'bd1118df888113546499eb9f70d49db4db51ee5e3fdda1ec4c326d4a6e2d6c91'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs