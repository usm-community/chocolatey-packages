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
  # Unique file name: ocenaudio and ocenaudio.install share this updater and are
  # processed in parallel by AU, so a fixed name makes both packages download to
  # (and delete) the same path, and the loser reads a missing/partial file.
  $dest = Join-Path $([System.IO.Path]::GetTempPath()) "ocenaudio_windows64_$([guid]::NewGuid().ToString('N')).exe"
  Get-WebFile $url64 $dest | Out-Null

  $checksumType = 'sha256'

  try {
    $version = (Get-ExeInfo -Path $dest)."Product Version"
    if (!$version) {
      throw "Unable to read 'Product Version' from '$dest' downloaded from $url64"
    }

    $result = @{
      URL64          = $url64
      Version        = $version
      Checksum64     = Get-FileHash $dest -Algorithm $checksumType | ForEach-Object Hash
      ChecksumType64 = $checksumType
    }
  }
  finally {
    Remove-Item -Force $dest -ErrorAction SilentlyContinue
  }

  return $result
}
function global:au_GetLatest {
  $url64 = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'

  # The ocenaudio meta package sources this file to reuse au_GetLatest, and
  # $PSScriptRoot always resolves to the defining script. Anchoring the ETag
  # cache here rather than to '.\info' gives both packages a single cache, so
  # the 58 MB installer is fetched once per actual release instead of on every
  # run of the meta package.
  $infoFile = Join-Path $PSScriptRoot 'info'

  $result = Update-OnETagChanged -execUrl $url64 -saveFile $infoFile -OnETagChanged {
    GetResultInformation $url64
  } -OnUpdated { @{ URL64 = $url64 } }

  return $result
}

if ($MyInvocation.InvocationName -ne '.') {
  # run the update only if script is not sourced
  update -ChecksumFor none -NoCheckUrl
}