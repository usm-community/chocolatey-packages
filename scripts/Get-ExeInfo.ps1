function Get-ExeInfo {
  param(
      [parameter(Mandatory = $true,
          HelpMessage = 'Provide the path to an EXE')]
      [ValidateNotNullOrEmpty()]
      [System.IO.FileInfo]$Path
  )

  if (!(Test-Path $Path)) {
      throw "Unable to find file '$Path'."
  }

  if (!(Get-Command 'exiftool' -ErrorAction SilentlyContinue)) {
      throw 'Unable to find exiftool command.'
  }

  $output = exiftool $Path

  $hash = @{}
  foreach ($line in $output) {
      $IndexColon = $line.IndexOf(':')
      if ($IndexColon -lt 0) { continue }
      $Property = $line.Substring(0, $IndexColon).Trim()
      $hash[$Property] = ($line.Substring($IndexColon + 1, $line.Length - $IndexColon - 1)).Trim()
  }

  return $hash
}
