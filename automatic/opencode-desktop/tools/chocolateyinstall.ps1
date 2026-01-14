$ErrorActionPreference = 'Stop';

$url = 'https://opencode.ai/download/windows-x64-nsis'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url64bit       = $url
  softwareName   = 'OpenCode*'
  checksum64     = 'e1611cd711064318d4885539a6f7568d94b08e1288be48ffae329c03ce64866e'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
