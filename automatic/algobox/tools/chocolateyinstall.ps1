$ErrorActionPreference = 'Stop'
$url64 = 'https://www.xm1math.net/algobox/assets/files/Algobox_1.1.1_Win_x64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64bit       = $url64
  softwareName   = 'Algobox*'
  checksum64     = '16831271F102ADAA3122C564CD216F3231983A14387277AE32D7B614DD6FF786'
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
