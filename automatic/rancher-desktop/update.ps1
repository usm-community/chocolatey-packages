Import-Module AU

$releases = 'https://api.github.com/repos/rancher-sandbox/rancher-desktop/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $latest_asset = (Invoke-RestMethod -Uri $releases).assets

    $url = $latest_asset | Where-Object browser_download_url -Match 'Rancher\.Desktop\.Setup\..*\.exe' | Select-Object -First 1 -ExpandProperty browser_download_url
    $version = Get-Version $url

    return @{
        Version = $version
        URL32   = $url
    }

}

update -ChecksumFor 32