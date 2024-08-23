$ErrorActionPreference = 'Stop'
$url = 'https://downcdn.raise3d.com/ideamaker/release/5.0.6-fix/install_ideaMaker_5.0.6.8380.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = 'f17bf7c346ee46037e0f5d8e534712297219aea6e37fd5c2fbebef9d146614f4'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
