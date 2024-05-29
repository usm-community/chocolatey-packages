$ErrorActionPreference = 'Stop'
$installDir = "C:\icy"

# Delete installation directory
if (Test-Path $installDir) {
  Remove-Item $installDir -ErrorAction SilentlyContinue -Recurse -Force
}

# Delete additional shortcuts
Remove-Item -Recurse "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Icy" -Force -ErrorAction SilentlyContinue
