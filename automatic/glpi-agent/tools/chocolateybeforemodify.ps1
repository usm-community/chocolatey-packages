$ErrorActionPreference = 'Stop' # stop on all errors

# Stop the service if it exists
$service = Get-Service -Name 'glpi-agent' -ErrorAction SilentlyContinue
If ($null -ne $service) {
  Stop-Service $service -Force
}