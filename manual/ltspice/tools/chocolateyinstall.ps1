$ErrorActionPreference = 'Stop';
$url64 = 'https://ltspice.analog.com/software/LTspice64.msi' 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = $url64
  softwareName   = 'LTspice*'
  checksum64     = '6718ABBD4F4FAEFE375C579DE775151525A9A1CCA821041796588A6EC05A5C99'
  checksumType64 = 'sha256' 
  silentArgs     = "/quiet"
}

Install-ChocolateyPackage @packageArgs