$ErrorActionPreference = 'Stop'
$url = 'https://cdn.zwift.com/app/ZwiftSetup.exe'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  softwareName   = 'zwift*'
  checksum       = '2F6E06BA61E7787DBF5FB42628A00C84AD3BE7E08437F7F831B302C1484B348A'
  checksumType   = 'sha256'
  silentArgs     = '/SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /NOCANCEL'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
