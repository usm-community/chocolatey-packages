$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2023.3.6/HTTPie-Setup-2023.3.6.exe'
$pp = Get-PackageParameters

$params = '/S'
if ($pp['allusers']) { $params = $params + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = '2e88b2de152c905b94b252e2c209ca8c4aaf48290a11e0645470fd9b58cad05b'
  checksumType   = 'sha256'
  silentArgs     = $params
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
