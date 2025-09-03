Import-Module Chocolatey-AU

$releases = 'https://www.xm1math.net/algobox/download.html'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'Algobox_[\d\.]+_Win_x64.msi$'
    $url = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -ExpandProperty href
    $version = Get-Version $url

    return @{
        Version = $version
        URL64   = "http://www.xm1math.net/algobox/$url"
    }
}

update -ChecksumFor none
