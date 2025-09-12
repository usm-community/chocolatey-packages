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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing -UserAgent "Chocolatey" -Headers @{
        "Accept" = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    }

    $url = $download_page.links | Where-Object href -Match 'install_ideaMaker_(?<version>[\d\.]+).exe$' | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version


    return @{
        Version = $version
        URL32   = $url
        Options = @{
            Headers = @{
                "Accept"     = "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
                "User-Agent" = "Chocolatey"
            }
        }
    }
}

update -ChecksumFor none
