$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = 'https://github.com/glpi-project/glpi-agent/releases/download/1.20/GLPI-Agent-1.20-x64.msi'
  checksum64    = '3767a04de4267b7f67c2cdd6ef9ad383187143bcbd030cb4683d7d678e4970b4'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
