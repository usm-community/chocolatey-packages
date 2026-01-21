$ErrorActionPreference = 'Stop'
$url = 'https://github.com/rancher-sandbox/rancher-desktop/releases/download/v1.22.0/Rancher.Desktop.Setup.1.22.0.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url            = $url
  softwareName   = 'Rancher Desktop*'
  checksum       = 'c12ad093e2f30d92ebabac7fe4630e496cbfb6cdde9de6f87e9800aed7b82306'
  checksumType   = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
