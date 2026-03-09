$ErrorActionPreference = 'Stop';
$url = 'https://github.com/anomalyco/opencode/releases/download/v1.2.22/opencode-desktop-windows-x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = 'f1b1fec710ecb2f681a13264c4f3f696fbef1466ce09f777b43a00c634f3b435'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
