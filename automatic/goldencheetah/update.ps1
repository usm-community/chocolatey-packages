Import-Module AU

$releases = 'https://api.github.com/repos/GoldenCheetah/GoldenCheetah/releases/latest'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)'"
            "(^[$]url64\s*=\s*)('.*')"           = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $latest_asset = (Invoke-RestMethod -Uri $releases).assets

    $url64 = $latest_asset | Where-Object browser_download_url -match 'GoldenCheetah_v.*_x64.exe' | Select-Object -First 1 -ExpandProperty browser_download_url
    $version = Get-Version $url64

    return @{
        Version = $version
        URL64   = $url64
    }
}

update -ChecksumFor none
