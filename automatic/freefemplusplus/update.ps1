Import-Module AU

$releases = 'https://api.github.com/repos/FreeFem/FreeFem-sources/releases/latest'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $latest_asset = (Invoke-RestMethod -Uri $releases).assets

    $regex = 'FreeFEM-.*-win64\.exe$'
    $url = $latest_asset | Where-Object browser_download_url -match $regex | Select-Object -First 1 -ExpandProperty browser_download_url
    $version = Get-Version $url

    return @{
        Version = $version
        URL64   = $url
    }

}

update -ChecksumFor none
