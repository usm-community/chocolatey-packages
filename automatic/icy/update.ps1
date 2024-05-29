param([string]$IncludeStream, [switch]$Force)

Import-Module au
Import-Module wormies-au-helpers

$releases = 'http://icy.bioimageanalysis.org/download/?os=Windows'

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*file\s*=\s*Join-Path \`$toolsDir).*" = "`${1} '$($Latest.FileName32)'"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -NoSuffix }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $url = Get-RedirectedUrl -url $($download_page.Links | Where-Object {$_.outerHTML -match 'Download For\s*Windows'} | Select-Object -First 1 -ExpandProperty href)
    $version = $(Get-Version -Version $url).Version
    $binary = $url.split('/')[-1]

    return @{
        Version = $version
        URL32   = $url
        Binary  = $binary
    }

}

update -ChecksumFor none
