Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyinstall.ps1"   = @{
      "(^[$]url\s*=\s*)('.*')"            = "`$1'$($Latest.URL32)'"
      "(?i)^(\s*checksum\s*=\s*)'.*'"     = "`${1}'$($Latest.Checksum32)'"
      "(?i)^(\s*checksumType\s*=\s*)'.*'" = "`${1}'$($Latest.ChecksumType32)'"
    }
  }
}

function GetResultInformation([string]$url32) {
  $dest = Join-Path $env:TEMP 'ZwiftSetup.exe'
  Get-WebFile $url32 $dest | Out-Null

  $checksumType = 'sha256'

  $result = @{
    URL32          = $url32
    Version        = Get-Item $dest | ForEach-Object { $_.VersionInfo.ProductVersion.Trim() }
    Checksum32     = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
    ChecksumType32 = $checksumType
  }

  Remove-Item -Force $dest

  return $result
}

function global:au_GetLatest {
  $url32 = 'https://cdn.zwift.com/app/ZwiftSetup.exe'

  $result = Update-OnETagChanged -execUrl $url32 -OnETagChanged {
    GetResultInformation $url32
  } -OnUpdated { @{ URL32 = $url32 } }

  return $result
}

update -ChecksumFor none
