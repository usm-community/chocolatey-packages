$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url64         = 'https://github.com/glpi-project/glpi-agent/releases/download/1.21/GLPI-Agent-1.21-x64.msi'
  checksum64    = '152bd777abc5a6d0e8a1f163af25c6b8c166f47895d115076b480863a5f0de6c'
  checksumType64= 'sha256' 
  silentArgs    = '/quiet'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
