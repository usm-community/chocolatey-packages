Import-Module Chocolatey-AU

$releases = 'https://api.github.com/repos/GoldenCheetah/GoldenCheetah/releases/latest'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $release = Invoke-RestMethod -Uri $releases

    # since 3.7 SP1 the Windows assets are suffixed with the Qt version (..._x64Qt6.exe)
    $exes = $release.assets.browser_download_url | Where-Object { $_ -match 'GoldenCheetah_v.*_x64.*\.exe$' }
    $url64 = $exes | Where-Object { $_ -match 'Qt6' } | Select-Object -First 1
    if (-not $url64) { $url64 = $exes | Select-Object -First 1 }
    if (-not $url64) { throw "No 64-bit Windows installer found in release '$($release.tag_name)'" }

    # tags look like 'v3.7' or 'v3.7-SP1'; a service pack becomes a 3rd part (3.7 -> 3.7.1)
    $version = Get-Version ($release.tag_name -replace '^v', '' -replace '-SP(\d+)$', '.$1')

    return @{
        Version = $version
        URL64   = $url64
    }
}

update -ChecksumFor none
