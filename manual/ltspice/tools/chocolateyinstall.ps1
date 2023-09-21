$ErrorActionPreference = 'Stop';
$url        = 'https://ltspice.analog.com/software/LTspice64.msi' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'LTspice*'
  checksum      = '48998B09194BF2D56AAE3D36810BB3AE536E7C60FBA76A30DE78107742E5EA7A'
  checksumType  = 'sha256' 
  silentArgs    = "/quiet"
}

Install-ChocolateyPackage @packageArgs