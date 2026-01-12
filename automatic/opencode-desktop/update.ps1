Import-Module Chocolatey-AU
Import-Module ([System.IO.Path]::Combine($env:ChocolateyInstall, 'helpers', 'chocolateyInstaller.psm1'))

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function GetResultInformation([string]$url64) {
    $dest = Join-Path $([System.IO.Path]::GetTempPath()) 'opencode-desktop.exe'
    Get-WebFile $url64 $dest | Out-Null

    $checksumType = 'sha256'
    $result = @{
        URL64      = $url64
        Version    = (Get-ExeInfo -Path $dest)."Product Version"
        Checksum64 = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
    }
    Remove-Item -Force $dest -ErrorAction SilentlyContinue

    return $result
}

function global:au_GetLatest {
    $url64 = 'https://opencode.ai/download/windows-x64-nsis'

    $result = Update-OnETagChanged -execUrl $url64 -OnETagChanged {
        GetResultInformation $url64
    } -OnUpdated { @{ URL64 = $url64 } }

    return $result
}

update -ChecksumFor none

