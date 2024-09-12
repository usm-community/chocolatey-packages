$ErrorActionPreference = 'Stop'
$url = 'https://purplepen.golde.org/downloads/purplepen-352.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Purple Pen*'
    checksum       = 'e0f8e11f502378bbe0a1a15fde05257c0e3e08d84d515dd98ae96b2c8f6749f6'
    checksumType   = 'sha256'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
