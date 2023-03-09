$ErrorActionPreference = 'Stop'
$url = 'https://download.raise3d.com/ideamaker/release/4.3.1/install_ideaMaker_4.3.1.6452.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = '23917f214f3bfa7a125c0b8283d38f003a5b376eb4957d2e5e442b25a37effbe'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
