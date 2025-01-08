$ErrorActionPreference = 'Stop'
$url = 'https://downcdn.raise3d.com/ideamaker/release/5.1.3/install_ideaMaker_5.1.3.8475.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = 'e4f39513066be9e8b5543248dd5662af0f1d1948aaf42f4a4c0e5c2332463676'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
