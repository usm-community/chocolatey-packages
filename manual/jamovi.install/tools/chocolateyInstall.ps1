$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'jamovi.install'
  fileType       = 'exe'
  url64bit       = 'https://archives.jamovi.org/jamovi-2.7.41.0-win-x64.exe'
  checksum64     = 'CBD43FB2384AC3A723B8ECACF55D1C8C00F3866114D8C38A7F0D84F4F3DDF86F'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
  Options     = @{
        Headers = @{
            Referer = 'https://www.jamovi.org/download.html'
        }
    }
}


Install-ChocolateyPackage @packageArgs
