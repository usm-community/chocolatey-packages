$ErrorActionPreference = 'Stop'
$url = 'https://www.femm.info/wiki/Files/files.xml?action=download&file=femm42bin_win32_21Apr2019.exe'
$url64 = 'https://www.femm.info/wiki/Files/files.xml?action=download&file=femm42bin_x64_21Apr2019.exe'
$version = 'femm 4.2 21Apr2019'

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $url
    url64bit       = $url64
    softwareName   = 'femm*'
    checksum       = '4C43CB8E5CC1165C5AAD157D73CAB3ECB956A766727C27058CCC7CBFE736F5A1'
    checksumType   = 'sha256'
    checksum64     = '17384E8990B6305EC8FFEF1F75B6EF091A266B6E49B30C151CD1DACA2E952043'
    checksumType64 = 'sha256'
    silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
    validExitCodes = @(0)
}

# Flag to check if install is required, default to false
$ExecInstall = $false

#Uninstalls the previous version of FEMM if either version exists
Write-Output "Searching if the previous version exists..."
[array]$checkreg = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($checkreg.Count -eq 0) {
    $installDir = Get-AppInstallLocation $packageArgs.softwareName
    if ($installDir) {
        Remove-Item $installDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    Write-Output 'No installed old version. Process to install FEMM.'
    # No version installed, process to install
    $ExecInstall = $true
} elseif ($checkreg.count -ge 1) {
    $checkreg | ForEach-Object {
        if ($null -ne $_.PSChildName) {
            if ($_.DisplayName -ne $version) {
                Write-Output "Uninstalling previous version : $($_.DisplayName)"
                $packageArgs['file'] = "$($_.UninstallString)"
                Uninstall-ChocolateyPackage @packageArgs

                $installDir = Get-AppInstallLocation $packageArgs.softwareName
                if ($installDir) {
                    Remove-Item $installDir -Recurse -Force -ErrorAction SilentlyContinue
                }

                # Process to install
                Write-Output "Installing new version of FEMM"
                $ExecInstall = $true
            } elseif (($_.DisplayName -eq $version) -and ($env:ChocolateyForce)) {
                Write-Output "$version already installed, but --force option is passed, download and install"
                $ExecInstall = $true
            } else {
                Write-Output 'Newest version or same version of FEMM is already installed, skip install'
            }
        }
    }
}

# Check if install is required
if ($ExecInstall) {
    Install-ChocolateyPackage @packageArgs
}