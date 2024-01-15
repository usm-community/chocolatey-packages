$ErrorActionPreference = 'Stop'
$url = 'https://purplepen.golde.org/downloads/purplepen-350.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'Purple Pen*'
    checksum       = 'd0777020adc9eac7031526014b1e0cf0f81dcc0101f9a2b24c71d64daabb0e88'
    checksumType   = 'sha256'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
