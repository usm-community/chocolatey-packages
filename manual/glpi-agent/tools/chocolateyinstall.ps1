$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  url           = 'https://github.com/glpi-project/glpi-agent/releases/download/1.5/GLPI-Agent-1.5-x86.msi'
  checksum      = 'b9ffaef446ac86fad22c19d7daf57b76918760ac828d990f390066ec2972d025'
  checksumType  = 'sha256' 
  url64         = 'https://github.com/glpi-project/glpi-agent/releases/download/1.5/GLPI-Agent-1.5-x64.msi'
  checksum64    = '0f2cfadee623013028b73bf31c89ca3f43a3797c95a7cf45fdeb320ea73a4b7d'
  checksumType64= 'sha256' 
  silentArgs    = "/quiet"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
