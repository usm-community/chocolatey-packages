$ErrorActionPreference = 'Stop'
$url64 = 'https://download.pydio.com/pub/cells-sync/release/0.9.4/windows-amd64/CellsSync-0.9.4.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64bit       = $url64
  softwareName   = 'cellssync*'
  checksum64     = 'FDBACB09AD6F674E57CAB533F2085A36D91D32FBCD05A5F8CEF9F12F12166918'
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
