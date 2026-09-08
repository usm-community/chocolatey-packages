# NOTE: No documentation will be written for this script.
# This is only a temporary script until a generic version
# have been added to the wormies-au-helpers powershell package

function Update-OnETagChanged() {
  param(
    [uri]$execUrl,
    [string]$saveFile = ".\info",
    [scriptblock]$OnETagChanged,
    [scriptblock]$OnUpdated
  )

  $request = [System.Net.WebRequest]::CreateDefault($execUrl)
  $request.UserAgent = "Chocolatey AU Package Updater"

  try {
    $response = $request.GetResponse()
    $etag = $response.Headers.Get("ETag")
  }
  finally {
    $response.Dispose()
    $response = $null
  }

  $saveResult = $false
  if (!(Test-Path $saveFile) -or ($global:au_Force -eq $true)) {
    $result = . $OnETagChanged
    $saveResult = $true
  }
  else {
    $existingInfo = (Get-Content $saveFile -Encoding UTF8 -TotalCount 1) -split '\|'

    if ($existingInfo[0] -ne $etag) {
      $result = . $OnETagChanged
      $saveResult = $true
    }
    else {
      $result = . $OnUpdated
      $result["Version"] = $existingInfo[1]
      $result["ETAG"] = $existingInfo[0]
      $saveResult = $false
    }
  }

  if ($saveResult) {
    $result["ETAG"] = $etag
    # Write through a temporary file: sibling packages can share one cache file
    # and run in parallel, so a reader must never see a half-written line.
    $tempFile = "$saveFile.$(Split-Path -Leaf $PWD).tmp"
    "$($result["ETAG"])|$($result["Version"])" | Out-File $tempFile -Encoding utf8 -NoNewline
    Move-Item -LiteralPath $tempFile -Destination $saveFile -Force
  }

  return $result
}
