$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = 'https://github.com/glpi-project/glpi-agent/releases/download/1.18/GLPI-Agent-1.18-x64.msi'
  checksum64    = '31f60fe349c56f4eac1d4d092441efa770924714b3fb61f18e4915e3dd70f9c4'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
