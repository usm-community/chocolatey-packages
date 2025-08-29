Import-Module au

$releases = 'http://jeanmarie.biansan.free.fr/optgeo.html'
$domain = 'http://jeanmarie.biansan.free.fr'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex = 'installateuroptgeo_.*\.exe$'
    $link = $download_page.links | Where-Object { $_.href -match $regex } | Select-Object -First 1 -ExpandProperty href

    $version = Get-Version $link

    return @{
        Version = $version
        URL32   = "$domain/$link"
    }
}

update -ChecksumFor none
