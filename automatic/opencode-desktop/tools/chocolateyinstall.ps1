$ErrorActionPreference = 'Stop';
$url = 'https://github.com/anomalyco/opencode/releases/download/v1.17.1/opencode-desktop-win-x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = 'eae72a2d472f0e402fcbf0504750d1688b05cfb8aaa06e70b3d4a2b237a73fb3'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
