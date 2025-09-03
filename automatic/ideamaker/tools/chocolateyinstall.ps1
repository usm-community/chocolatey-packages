$ErrorActionPreference = 'Stop'
$url = 'https://downcdn.raise3d.com/ideamaker/release/5.2.4/install_ideaMaker_5.2.4.8581.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = ''
    checksumType   = ''
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
