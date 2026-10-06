$ErrorActionPreference = 'Stop'
$url = 'https://download.geogebra.org/installers/6.0/GeoGebra-Windows-Installer-6-0-931-2.msi'
$version = [version]'6.0.931.2'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'MSI'
    url            = $url
    softwareName   = 'GeoGebra Classic*'
    checksum       = '0d5d95984bc2fa4c7831b6f496a5aa1b01d5f1e70110ad1a2e192bba37905e92'
    checksumType   = 'sha256'
    silentArgs     = "ALLUSERS=2 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
    validExitCodes = @(0, 3010, 1641)
}

#Uninstalls the previous version of Geogebra Classic if either version exists
Write-Output 'Searching if the previous version exists...'
[array]$checkreg = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($checkreg.Count -eq 0) {
    Write-Output 'No installed old version. Process to install Geogebra Classic.'
    # No version installed, process to install
    $ExecInstall = $true
} elseif ($checkreg.count -ge 1) {
    $checkreg | ForEach-Object {
        if ($null -ne $_.PSChildName) {
            if ([version]$_.DisplayVersion -lt $version) {
                Write-Output "Uninstalling Geogebra Classic previous version : $($_.DisplayVersion)"

                $unInstallArgs = @{
                    packageName    = $env:ChocolateyPackageName
                    softwareName   = 'GeoGebra Classic*'
                    fileType       = 'MSI'
                    file           = ''
                    silentArgs     = "$($_.PSChildName) /qn /norestart"
                    validExitCodes = @(0, 3010, 1605, 1614, 1641)
                }
                Uninstall-ChocolateyPackage @unInstallArgs
                # Process to install
                Write-Output 'Installing new version of Geogebra Classic'
                $ExecInstall = $true
            } elseif (([version]$_.DisplayVersion -eq $version) -and ($env:ChocolateyForce)) {
                Write-Output "Geogebra Classic $version already installed, but --force option is passed, download and install"
                $ExecInstall = $true
            } else {
                Write-Output 'Newest version or same version of Geogebra Classic is already installed, skip install'
                $ExecInstall = $false
            }
        }
    }
}

# Check if install is required
if ($ExecInstall) {
    Install-ChocolateyPackage @packageArgs
}
