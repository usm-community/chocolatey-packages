﻿$ErrorActionPreference = 'Stop'
$url64 = 'https://sourceforge.net/projects/pymca/files/pymca/PyMca5.9.2/pymca5.9.2-win64.exe'
$version = [version]'5.9.2'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url64bit       = $url64
    softwareName   = 'pymca*'
    checksum64     = '25adda72143422bb38d47df8b537f22831423a81d3fd8e5fd01744a150f193be'
    checksumType64 = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

#Uninstalls the previous version of PyMca if either version exists
Write-Output 'Searching if the previous version exists...'

[array]$checkreg = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($checkreg.Count -eq 0) {
    Write-Output 'No installed old version. Process to install PyMca.'
    # No version installed, process to install
    $ExecInstall = $true
} elseif ($checkreg.count -ge 1) {
    $checkreg | ForEach-Object {
        if ($null -ne $_.PSChildName) {
            if ([version]$_.DisplayVersion -lt $version) {
                Write-Output "Uninstalling PyMca previous version : $($_.DisplayVersion)"
                $packageArgs['file'] = "$($_.UninstallString)"

                # Uninstall previous version
                Uninstall-ChocolateyPackage @packageArgs
        

                # Process to install
                Write-Output 'Installing new version of PyMca'
                $ExecInstall = $true
            } elseif (([version]$_.DisplayVersion -eq $version) -and ($env:ChocolateyForce)) {
                Write-Output "PyMca $version already installed, but --force option is passed, download and install"
                $ExecInstall = $true
            } else {
                Write-Output 'Newest version or same version of PyMca is already installed, skip install'
                $ExecInstall = $false
            }
        }
    }
}

# Check if install is required
if ($ExecInstall) {
    Install-ChocolateyPackage @packageArgs
}
