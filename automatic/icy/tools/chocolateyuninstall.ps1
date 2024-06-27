$ErrorActionPreference = 'Stop'
$installDir = "C:\icy"

# Delete installation directory
if (Test-Path $installDir) {
  Remove-Item $installDir -ErrorAction SilentlyContinue -Recurse -Force
} else {
  Write-Warning "Cannot find Icy in 'C:\Icy', might have been installed elsewhere..."
}

# Delete additional shortcuts
Remove-Item -Recurse "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Icy" -Force -ErrorAction SilentlyContinue
