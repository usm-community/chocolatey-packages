Import-Module au

$releases = 'https://www.arduino.cc/en/software'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]version\s*=\s*)('.*')"  = "`$1'$($Latest.Version)'"
            "(^[$]url64\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | Where-Object href -match 'arduino-ide_(?<version>[\d\.]+)_Windows_64bit.zip$' | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version

    return @{
        Version  = $version
        URL64    = $url
    }
}

update -ChecksumFor 64