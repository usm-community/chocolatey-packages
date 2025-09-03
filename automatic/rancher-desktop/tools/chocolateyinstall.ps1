$ErrorActionPreference = 'Stop'
$url = 'https://github.com/rancher-sandbox/rancher-desktop/releases/download/v1.20.0/Rancher.Desktop.Setup.1.20.0.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url            = $url
  softwareName   = 'Rancher Desktop*'
  checksum       = ''
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
