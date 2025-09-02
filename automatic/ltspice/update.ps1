Import-Module AU
Import-Module ([System.IO.Path]::Combine($env:ChocolateyInstall, 'helpers', 'chocolateyInstaller.psm1'))

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function GetResultInformation([string]$url64) {
    $dest = Join-Path $([System.IO.Path]::GetTempPath()) 'LTspice64.msi'
    Get-WebFile $url64 $dest | Out-Null

    $checksumType = 'sha256'
    $result = @{
        URL64      = $url64
        Version    = (Get-MsiInformation -Path $dest).ProductVersion
        Checksum64 = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
    }
    Remove-Item -Force $dest -ErrorAction SilentlyContinue

    return $result
}

function global:au_GetLatest {
    $url64 = 'https://ltspice.analog.com/software/LTspice64.msi'

    $result = Update-OnETagChanged -execUrl $url64 -OnETagChanged {
        GetResultInformation $url64
    } -OnUpdated { @{ URL64 = $url64 } }

    return $result
}

update -ChecksumFor none