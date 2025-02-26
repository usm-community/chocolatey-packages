$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2025.1.0/HTTPie-Setup-2025.1.0.exe'
$pp = Get-PackageParameters

$params = '/S'
if ($pp['allusers']) { $params = $params + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = '1cc8405c648ec2a2be679cb16713d304453a05a379a4024dee7af18f6921ab38'
  checksumType   = 'sha256'
  silentArgs     = $params
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
