$ErrorActionPreference = 'Stop'
$url = 'https://download.raise3d.com/ideamaker/release/4.3.2/install_ideaMaker_4.3.2.6470.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = 'bd385b52fd762f11e9d6ffb622b887a57708335e05f20af7dc9b4a383ae17a43'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
