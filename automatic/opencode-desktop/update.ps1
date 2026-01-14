Import-Module Chocolatey-AU

$releases = 'https://api.github.com/repos/anomalyco/opencode/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $latest_asset = (Invoke-RestMethod -Uri $releases).assets

    $url = $latest_asset | Where-Object browser_download_url -Match 'opencode-desktop-windows-x64.exe' | Select-Object -First 1 -ExpandProperty browser_download_url
    $version = Get-Version $url

    return @{
        Version = $version
        URL64   = $url
    }

}

update -ChecksumFor none
