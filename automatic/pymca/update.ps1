Import-Module au

$releases = 'https://sourceforge.net/projects/pymca/files/pymca'
$domain = 'https://sourceforge.net'

function global:au_SearchReplace {
    @{
        '.\tools\chocolateyinstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"              = "`$1'$($Latest.URL64)'"
            "(^[$]version\s*=\s*\[version\])('.*')" = "`$1'$($Latest.Version)'"
            "(^\s*checksum64\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest_release = $download_page.Links | Where-Object href -Match 'PyMca\d\.\d\.\d' | Select-Object -First 1 -ExpandProperty href

    $url_latest_release = $domain + $latest_release
    $download_page_latest = Invoke-WebRequest -Uri $url_latest_release -UseBasicParsing
    $link = $download_page_latest.Links | Where-Object href -Match 'pymca.*-win64.exe' | Select-Object -First 1 -ExpandProperty href
    $version = Get-Version $link

    return @{
        Version = $version
        URL64   = "https://sourceforge.net/projects/pymca/files/pymca/PyMca${version}/pymca${version}-win64.exe"
    }
}

update -ChecksumFor none -NoCheckUrl
