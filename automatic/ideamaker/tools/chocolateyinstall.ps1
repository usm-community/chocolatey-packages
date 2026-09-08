$ErrorActionPreference = 'Stop'
$url = 'https://downcdn.raise3d.com/ideamaker/release/5.4.2/install_ideaMaker_5.4.2.8790.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'ideamaker*'
    checksum       = 'f53cdc9b9582ff7dc78de51b13f6ed22770c6ba81ac23f3339b4945959be0f48'
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
