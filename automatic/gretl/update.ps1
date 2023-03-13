Import-Module au

$releases = 'http://gretl.sourceforge.net/win32/'

function global:au_SearchReplace {
    @{
        '.\tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"       = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumType32)'"
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
            "(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $url32 = $download_page.links | Where-Object href -Match 'gretl-(.*)-32.exe$' | Select-Object -First 1 -ExpandProperty href
    $url64 = $download_page.links | Where-Object href -Match 'gretl-(.*)-64.exe$' | Select-Object -First 1 -ExpandProperty href

    $download_page.ParsedHtml.all.tags("p") | Where-Object { $_.InnerText -match 'latest release \((?<releasedate>\w+ \d+, \d{4})\)' } | Select-Object -First 1 -ExpandProperty InnerText
    if ($Matches.releasedate -ne '') {
        $date = [datetime]::ParseExact($Matches.releasedate, 'MMM d, yyyy', [cultureinfo]::InvariantCulture)
        $version = $date.ToString('yyyy.yyMMdd')
    } else {
        throw 'No release date match to defined mask'
    }

    return @{
        Version = $version
        URL32   = $url32
        URL64   = $url64
    }
}

update -ChecksumFor all
