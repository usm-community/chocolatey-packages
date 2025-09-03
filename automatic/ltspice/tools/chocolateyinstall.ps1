$ErrorActionPreference = 'Stop'
$url64 = 'https://ltspice.analog.com/software/LTspice64.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = $url64
  softwareName   = 'LTspice*'
  checksum64     = 'AF93F7916FE70CDF7D99B4E4943AE67A0737C1F2286AD9900BC1DE028A1E987F'
  checksumType64 = 'sha256'
  silentArgs     = 'AI_INSTALLPERUSER=0 /quiet'
}

Install-ChocolateyPackage @packageArgs

#Disable auto update pop up message
$UpdateConfigFile = Join-Path $env:ProgramFiles 'ADI\LTspice\updater.ini'
if (Test-Path $UpdateConfigFile) {
  $UpdateConfigFileContent = Get-Content $UpdateConfigFile
  if ($UpdateConfigFileContent -match 'CheckFrequency=\d') {
    $UpdatedConfigFileContent = $UpdateConfigFileContent -replace 'CheckFrequency=\d', 'CheckFrequency=0'
    Set-Content -Path $UpdateConfigFile -Value $UpdatedConfigFileContent
  }
}
