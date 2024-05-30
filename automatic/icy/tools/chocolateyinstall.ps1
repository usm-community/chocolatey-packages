$ErrorActionPreference = 'Stop'
$url = "https://icy.bioimageanalysis.org/download-file/?id=93843"
$pp = Get-PackageParameters
#If parameter INSTALLDIR not set, defaults to C:\
if (!$pp['INSTALLDIR']) { $pp['INSTALLDIR'] = "C:\" }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  UnzipLocation = $pp['INSTALLDIR']
  url           = $url
  Checksum      = "4257D5B3E7007ECC780EC5FD3B6FCE23EFCDE7DCFDA19D2ECFC99F93F0C0F8BD"
  ChecksumType  = "SHA256"
  
}

# Delete previous additional shortcuts
if (Test-Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Icy") {
  Remove-Item -Recurse "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Icy" -Force -ErrorAction SilentlyContinue
}
# Delete previous desktop shortcuts
if (Test-Path "$env:Public\Desktop\Icy.lnk") {
  Remove-Item "$env:Public\Desktop\Icy.lnk" -Force -ErrorAction SilentlyContinue
}

# Unzip file to installDir and remove archive
Install-ChocolateyZipPackage @packageArgs

# Create Start Menu shorcuts
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Icy\Icy.lnk" -targetPath "$($pp['INSTALLDIR'])Icy\icy.exe" -WorkingDirectory "$($pp['INSTALLDIR'])"
