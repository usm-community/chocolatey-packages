$ErrorActionPreference = 'Stop'
$url = 'https://github.com/rancher-sandbox/rancher-desktop/releases/download/v1.9.1/Rancher.Desktop.Setup.1.9.1.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'Rancher Desktop*'
  checksum       = '5f7bc72fc159864b84464f6dc967be5c7379529b04c983a2d5e1f85b6ff3f358'
  checksumType   = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
