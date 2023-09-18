$ErrorActionPreference = 'Stop'
$url = 'https://github.com/httpie/desktop/releases/download/v2023.3.5/HTTPie-Setup-2023.3.5.exe'
$pp = Get-PackageParameters

$args = '/S'
if ($pp['allusers']) { $args = $args + " /AllUsers" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'HTTPie*'
  checksum       = 'edd42f3754e91ff41d8013867a3ec28ba8941c784bcbd230448e6a96b4006eae'
  checksumType   = 'sha256'
  silentArgs     = $args
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
