$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2025.2.0/HTTPie-Setup-2025.2.0.exe'
$pp = Get-PackageParameters

$params = '/S'
if ($pp['allusers']) { $params = $params + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = '17f0e0312ac813cd6517b271bff4c0af74d452822075e97bc26e420de0800ed5'
  checksumType   = 'sha256'
  silentArgs     = $params
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
