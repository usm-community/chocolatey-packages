$ErrorActionPreference = 'Stop'
$url64 = 'http://www.xm1math.net/algobox/assets/files/Algobox_1.2.0_Win_x64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64bit       = $url64
  softwareName   = 'Algobox*'
  checksum64     = '1fdf50acc3a40a98e54ad7a6d8b949a609f3862fc8b001e62491af036577669d'
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
