$ErrorActionPreference = 'Stop'
$url = 'http://cpntools.org/downloads/cpntools_4.0.1.exe'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    softwareName   = 'cpn tools*'
    checksum       = 'B040B59FB9F09E0972D7BF89E6097C5E925802FB566E75A723465ADD83E7E8D3'
    checksumType   = 'sha256'
    silentArgs     = '--mode unattended --enable-components debugger,ppcpnet,newcomponent'
    validExitCodes = @(0)
}

#Uninstalls the previous version of CPN Tools if either version exists
Write-Output "Searching if the previous version exists..."

[array]$checkreg = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($checkreg.Count -eq 0) {
    Write-Output 'No installed old version. Process to install CPN Tools.'
    # No version installed, process to install
    Install-ChocolateyPackage @packageArgs
} elseif ($checkreg.count -ge 1) {
    $checkreg | ForEach-Object {
        if ([version]$_.DisplayVersion -lt $version) {
            Write-Output "Uninstalling CPN Tools previous version : $($_.DisplayVersion)"
            $packageArgs['silentArgs'] = '--mode unattended'
            $packageArgs['file'] = "$($_.UninstallString)"
            Uninstall-ChocolateyPackage @packageArgs

            # Reset to default values
            $packageArgs['file'] = ''
            $packageArgs['silentArgs'] = '--mode unattended --enable-components debugger,ppcpnet,newcomponent'

            # Process to install
            Write-Output "Installing new version of CPN Tools"
            Install-ChocolateyPackage @packageArgs
        } elseif (([version]$_.DisplayVersion -eq $version) -and ($env:ChocolateyForce)) {
            Write-Output "CPN Tools $version already installed, but --force option is passed, download and install"
            Install-ChocolateyPackage @packageArgs
        }
    }
}
