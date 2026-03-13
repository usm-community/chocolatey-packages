$ErrorActionPreference = 'Stop';
$url = 'https://github.com/anomalyco/opencode/releases/download/v1.2.25/opencode-desktop-windows-x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = 'aee8768c7d6a055830cb16ba5b6a115309aa240c221da0fbcf6174e41f77c32f'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
