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

function global:au_BeforeUpdate {
    $Algorithm = 'sha256'
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Algorithm $Algorithm
    $Latest.ChecksumType32 = $Algorithm
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64 -Algorithm $Algorithm
    $Latest.ChecksumType64 = $Algorithm
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $url32 = $download_page.links | Where-Object href -Match 'gretl-(.*)-32.exe$' | Select-Object -First 1 -ExpandProperty href
    $url64 = $download_page.links | Where-Object href -Match 'gretl-(.*)-64.exe$' | Select-Object -First 1 -ExpandProperty href

    $($download_page.RawContent).Split("`n") | Where-Object { $_ -Match "<td><p>latest release\s+\((?<releasedate>\w+\s+\d+,\s+\d{4})\)</p></td>"}| Select-Object -First 1
    if ($Matches.releasedate -ne '') {
        $cleanDate = $Matches.releasedate -replace '\s+', ' '
        $cleanDate = $cleanDate.Trim()
        $date = [datetime]::ParseExact($cleanDate, 'MMM d, yyyy', [cultureinfo]::InvariantCulture)
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

update -ChecksumFor none
