﻿$ErrorActionPreference = 'Stop'
$url64 = 'https://gmsh.info/bin/Windows/gmsh-4.14.1-Windows64.zip'
$installDir = 'C:\gmsh'
$version = '4.14.1'
$dirToExtract = "gmsh-$version-Windows64"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $installDir
  url64bit       = $url64
  checksum64     = 'b3464b7e170f39639bc74b47334e7eab5cb44fa9317d16ff0c55b42bb04a1b80'
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
