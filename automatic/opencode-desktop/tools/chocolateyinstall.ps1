$ErrorActionPreference = 'Stop';
$url = 'https://github.com/anomalyco/opencode/releases/download/v1.15.13/opencode-desktop-win-x64.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = 'e19e97c5ca15767523ecfe502fbd6058738a68919d2d142574501820b489e775'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
