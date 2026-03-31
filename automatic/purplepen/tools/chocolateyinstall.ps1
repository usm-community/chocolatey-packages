$ErrorActionPreference = 'Stop'
$url = 'https://purple-pen.org/downloads/purplepen-355.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Purple Pen*'
    checksum       = 'eca37b59a0b228030d5d92bb66c4c078c29285423e8f54362e830eb1844d3164'
    checksumType   = 'sha256'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
