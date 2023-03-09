$ErrorActionPreference = 'Stop'
$installDir = "C:\gmsh"

# Delete installation directory
if (Test-Path $installDir) {
  Remove-Item $installDir -ErrorAction SilentlyContinue -Recurse -Force
}

# Delete additional shortcuts
Remove-Item -Recurse "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Gmsh" -Force -ErrorAction SilentlyContinue

# Delete shim
Uninstall-BinFile -Name "gmsh"
