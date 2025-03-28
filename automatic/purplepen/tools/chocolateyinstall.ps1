$ErrorActionPreference = 'Stop'
$url = 'https://purple-pen.org/downloads/purplepen-353.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Purple Pen*'
    checksum       = '8528a51eb85b55910f076e978acfee2c1c275d5fc7adbcc87d6827bf3667281c'
    checksumType   = 'sha256'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
