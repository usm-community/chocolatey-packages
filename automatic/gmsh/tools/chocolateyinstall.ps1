$ErrorActionPreference = 'Stop'
$url64 = 'https://gmsh.info/bin/Windows/gmsh-4.15.0-Windows64.zip'
$installDir = 'C:\gmsh'
$version = '4.15.0'
$dirToExtract = "gmsh-$version-Windows64"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $installDir
  url64bit       = $url64
  checksum64     = 'd522f3c5b8921e48e9f92c6162de753bb9c5c6de1f783ee38d84b5aa2a601212'
  checksumType64 = 'sha256'
}

# Unzip file to installDir
Install-ChocolateyZipPackage @packageArgs

# Location of executable
$exeLocation = "$installDir\$dirToExtract\gmsh.exe"

# Create Start Menu shorcuts
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Gmsh\Gmsh.lnk" -targetPath $exeLocation -WorkingDirectory "$installDir\$dirToExtract" -IconLocation $exeLocation

# Create shim
Install-BinFile -Name "gmsh" -Path "$exeLocation"

# Remove old version of Gmsh
Get-ChildItem -Path $installDir -Exclude $dirToExtract | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
