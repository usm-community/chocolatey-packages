Import-Module AU

$releases = 'https://www.arduino.cc/en/software'
$releases = 'https://api.github.com/repos/arduino/arduino-ide/releases/latest'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyinstall.ps1" = @{
            "(^[$]version\s*=\s*)('.*')"  = "`$1'$($Latest.Version)'"
            "(^[$]url64\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $latest_asset = (Invoke-RestMethod -Uri $releases).assets
    $url = $latest_asset | Where-Object browser_download_url -Match 'arduino-ide_(?<version>[\d\.]+)_Windows_64bit.zip$' | Select-Object -First 1 -ExpandProperty browser_download_url

    $version = Get-Version $url

    return @{
        Version  = $version
        URL64    = $url
    }
}

update -ChecksumFor 64
