Import-Module Chocolatey-AU

$releases = 'http://cpntools.org/category/downloads/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
    $chooseos_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $urltodownload = $chooseos_page.Links | Where-Object href -Match '\/Windows\/' | Select-Object -First 1 -ExpandProperty href
    $download_page = Invoke-WebRequest -Uri $urltodownload -UseBasicParsing

    $url = $download_page.Links | Where-Object title -Match 'CPN Tools\s*(?<version>[\d\.]+)' | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version

    return @{
        Version = $version
        URL32   = $url
    }
}

update -ChecksumFor none
