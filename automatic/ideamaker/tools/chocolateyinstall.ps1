$ErrorActionPreference = 'Stop'
$url = 'https://downcdn.raise3d.com/ideamaker/release/5.5.3/install_ideaMaker_5.5.3.8850.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = 'd103f9576c680fdcece77bb07be04bcace92383e469beb3b84ceceeac48b946e'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
