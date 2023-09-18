$ErrorActionPreference = 'Stop'
$url = 'https://cdn.zwift.com/app/ZwiftSetup.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'zwift*'
  checksum       = 'CB905D122341D535E9A23E080223D197A16C5A4ED57A59CFD0413925DB544012'
  checksumType   = 'sha256'
  silentArgs     = '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCANCEL'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
