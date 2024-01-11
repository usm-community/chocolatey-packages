$ErrorActionPreference = 'Stop' # stop on all errors

# Remove the service if it exists
$service = Get-Service -Name 'glpi-agent' -ErrorAction SilentlyContinue
If ($service -ne $null) {
  Stop-Service $service -Force
}