Import-Module Chocolatey-AU
Import-Module ([System.IO.Path]::Combine($env:ChocolateyInstall, 'helpers', 'chocolateyInstaller.psm1'))

function global:au_SearchReplace {
  @{
    "tools\chocolateyinstall.ps1" = @{
      "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}
function GetResultInformation([string]$url64) {
  $dest = Join-Path $([System.IO.Path]::GetTempPath()) 'ocenaudio_windows64.exe'
  Get-WebFile $url64 $dest | Out-Null

  $checksumType = 'sha256'

  $version = (Get-ExeInfo -Path $dest)."Product Version"
  Write-Output "Version: $version"

  $result = @{
    URL64          = $url64
    Version        = (Get-ExeInfo -Path $dest)."Product Version"
    Checksum64     = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
    ChecksumType64 = $checksumType
  }

  Remove-Item -Force $dest

  return $result
}
function global:au_GetLatest {
  $url64 = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'

  $result = Update-OnETagChanged -execUrl $url64 -OnETagChanged {
    GetResultInformation $url64
  } -OnUpdated { @{ URL64 = $url64 } }

  return $result
}

if ($MyInvocation.InvocationName -ne '.') {
  # run the update only if script is not sourced
  update -ChecksumFor none -NoCheckUrl
}