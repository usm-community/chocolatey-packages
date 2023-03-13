Import-Module AU

$releases = 'https://gmsh.info/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]version\s*=\s*)('.*')"  = "`$1'$($Latest.Version)'"
            "(^[$]url64\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $regex = 'gmsh-(?<version>[\d\.]*)-Windows64\.zip$'
    $url = $download_page.links | Where-Object href -Match $regex | Select-Object -First 1 -ExpandProperty href
    $version = $Matches.version

    return @{
        Version = $version
        URL64   = "${releases}${url}"
    }
}

update -ChecksumFor none
