$ErrorActionPreference = 'Stop'
$url = 'https://cdn.zwift.com/app/ZwiftSetup.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'zwift*'
  checksum       = '6FB5D700A45F8FCE2595F1E8765C2CABCCDF55BB515F347AD53D90A14BAEECC9'
  checksumType   = 'sha256'
  silentArgs     = '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCANCEL'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
