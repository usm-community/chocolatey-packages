$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = 'https://github.com/glpi-project/glpi-agent/releases/download/1.16/GLPI-Agent-1.16-x64.msi'
  checksum64    = '1210c10dfc9921f28f591a3352d8f6ef898c737980db833773ff8cda5681be90'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
