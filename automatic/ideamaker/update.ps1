param([string]$IncludeStream, [switch]$Force)

Import-Module au

$releases = 'https://www.raise3d.com/download/ideamaker-all-versions/'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"             = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"        = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')"    = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | Where-Object href -match 'install_ideaMaker_(?<version>[\d\.]+).exe$' | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version

    return @{
        Version  = $version
        URL32    = $url
    }
}

update -ChecksumFor 32 -NoCheckChocoVersion
