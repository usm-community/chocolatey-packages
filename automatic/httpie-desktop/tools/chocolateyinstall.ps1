$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2024.1.2/HTTPie-Setup-2024.1.2.exe'
$pp = Get-PackageParameters

$params = '/S'
if ($pp['allusers']) { $params = $params + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = '289c48da7f5da79ad4ca4252594d2dd61568a5bd25a18ce2a648e496c1caac80'
  checksumType   = 'sha256'
  silentArgs     = $params
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
