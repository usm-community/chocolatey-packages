$ErrorActionPreference = 'Stop';
$url64 = 'https://ltspice.analog.com/software/LTspice64.msi' 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'MSI'
  url64          = $url64
  softwareName   = 'LTspice*'
  checksum64     = '6718ABBD4F4FAEFE375C579DE775151525A9A1CCA821041796588A6EC05A5C99'
  checksumType64 = 'sha256' 
  silentArgs     = "AI_INSTALLPERUSER=0 /quiet"
}

Install-ChocolateyPackage @packageArgs

#Disable auto update pop up message
$UpdateConfigFile = Join-Path $env:ProgramFiles "ADI\LTspice\updater.ini"
if(Test-Path $UpdateConfigFile){
  $UpdateConfigFileContent = Get-Content $UpdateConfigFile
  if($UpdateConfigFileContent -match "CheckFrequency=\d"){
    $UpdatedConfigFileContent = $UpdateConfigFileContent -replace "CheckFrequency=\d","CheckFrequency=0"
    Set-Content -Path $UpdateConfigFile -Value $UpdatedConfigFileContent
  }
}
