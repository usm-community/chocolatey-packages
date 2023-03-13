param([string]$IncludeStream, [switch]$Force)

import-module au

$releases = 'https://download.geogebra.org/installers/6.0'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"                = "`$1'$($Latest.URL32)'"
            "(^[$]version\s*=\s*\[version\])('.*')" = "`$1'$($Latest.Version)'"
            "(^\s*checksum\s*=\s*)('.*')"           = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksumType\s*=\s*)('.*')"       = "`$1'$($Latest.ChecksumType32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'GeoGebra-Windows-Installer-\d-\d-\d{3}-\d\.msi$'
    $url = $download_page.links | Where-Object href -match $regex | Select-Object -Last 1 -expand href
    $version = Get-Version ($url -replace '-', '.')

    return @{
        Version = $version
        URL32   = "$releases/$url"
    }

}

update -ChecksumFor 32
