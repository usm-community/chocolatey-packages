$ErrorActionPreference = 'Stop';
$url = 'https://github.com/anomalyco/opencode/releases/download/v1.18.10/opencode-desktop-win-x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = '3141a7f01f90eb4e00519257ca35fd6cab54f825283ab944d9412f908a64651e'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
