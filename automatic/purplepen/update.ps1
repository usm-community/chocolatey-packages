param([string]$IncludeStream, [switch]$Force)

Import-Module Chocolatey-AU

$releases  = 'https://purple-pen.org/downloads'
$userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Headers $Latest.Options.Headers
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent $userAgent
    $regex = 'purplepen-(\d)(\d)(\d)\.exe$'

    $url = ($download_page.Links | Where-Object href -Match $regex | Select-Object -Last 1 -ExpandProperty href)
    $version = "$($Matches[1]).$($Matches[2]).$($Matches[3])"

    return @{
        Version = $version
        URL32   = "$releases/$url"
        Options = @{
            Headers = @{
                'User-Agent' = $userAgent
                'Referer'    = "$releases/"
            }
        }
    }

}

update -ChecksumFor none
