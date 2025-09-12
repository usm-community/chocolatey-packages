param([string]$IncludeStream, [switch]$Force)

Import-Module Chocolatey-AU

$releases = 'https://www.raise3d.com/download/ideamaker-all-versions/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32 -Headers $Latest.Options.Headers
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" -Headers @{
        "Accept"                    = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
        "Accept-Language"           = "en-US,en;q=0.5"
        "Accept-Encoding"           = "gzip, deflate"
        "DNT"                       = "1"
        "Connection"                = "keep-alive"
        "Upgrade-Insecure-Requests" = "1"
    }

    $url = $download_page.Links | Where-Object href -Match 'install_ideaMaker_(?<version>[\d\.]+).exe$' | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version

    return @{
        Version = $version
        URL32   = $url
        Options = @{
            Headers = @{
                "Accept"                    = "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
                "Accept-Language"           = "en-US,en;q=0.5"
                "Accept-Encoding"           = "gzip, deflate"
                "DNT"                       = "1"
                "Connection"                = "keep-alive"
                "Upgrade-Insecure-Requests" = "1"
                "User-Agent"                = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
            }
        }
    }
}

update -ChecksumFor none
