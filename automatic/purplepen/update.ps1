param([string]$IncludeStream, [switch]$Force)

Import-Module au

$releases = 'https://purplepen.golde.org/downloads'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'purplepen-(\d)(\d)(\d)\.exe$'

    $url = ($download_page.Links | Where-Object href -Match $regex | Select-Object -Last 1 -ExpandProperty href )
    $version = "$($Matches[1]).$($Matches[2]).$($Matches[3])"

    return @{
        Version = $version
        URL     = "$releases/$url"
    }

}

update -ChecksumFor 32
