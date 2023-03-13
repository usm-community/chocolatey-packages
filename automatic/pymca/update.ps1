Import-Module au

$releases = 'https://sourceforge.net/projects/pymca/files/'

function global:au_SearchReplace {
    @{
        '.\tools\chocolateyinstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"              = "`$1'$($Latest.URL64)'"
            "(^[$]version\s*=\s*\[version\])('.*')" = "`$1'$($Latest.Version)'"
            "(^\s*checksum64\s*=\s*)('.*')"         = "`$1'$($Latest.Checksum64)'"
            "(^\s*checksumType64\s*=\s*)('.*')"     = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $title = $download_page.Links | Where-Object title -Match 'pymca.*-win64.exe' | Select-Object -First 1 -ExpandProperty title
    $version = Get-Version $title

    return @{
        Version = $version
        URL64   = "https://sourceforge.net/projects/pymca/files/pymca/PyMca${version}/pymca${version}-win64.exe"
    }
}

update -ChecksumFor 64 -NoCheckUrl
