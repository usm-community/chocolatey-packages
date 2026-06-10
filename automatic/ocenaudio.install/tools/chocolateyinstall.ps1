$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = 'ACCDBACCBFF4BC78BC64A9B991A5CC5ED5BB4FDF27779808C7A48ACD4587CE16'
  checksumType64 = 'sha256'
  silentArgs     = "/allusers /S"
}

Install-ChocolateyPackage @packageArgs
