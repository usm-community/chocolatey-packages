$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2023.1.2/HTTPie-Setup-2023.1.2.exe'
$pp = Get-PackageParameters

$args = '/S'
if ($pp['allusers']) { $args = $args + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = 'a42ee5ca43bc3f4b28c655d590eb2874af6d11802389dea5be093ab572a9da9f'
  checksumType   = 'sha256'
  silentArgs     = $args
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
