$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'GLPI Agent*'
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -eq 1) {
  $packageArgs['silentArgs'] = "$($key.PSChildName) $($packageArgs['silentArgs'])"
  Uninstall-ChocolateyPackage @packageArgs

  # Remove folders
  if(Test-Path $($key.InstallLocation)) {
    if(Test-Path "$($key.InstallLocation)logs\glpi-agent.log") {
      Move-Item -Path "$($key.InstallLocation)logs\glpi-agent.log" -Destination $env:TEMP -Force -ErrorAction SilentlyContinue
    }
    Remove-Item -Path $($key.InstallLocation) -Recurse -Force -ErrorAction SilentlyContinue
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means.."
} elseif ($key.Count -gt 1) {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $($_.DisplayName)"}
}