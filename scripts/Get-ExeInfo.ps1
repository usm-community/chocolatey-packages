function Get-ExeInfo {
  param(
      [parameter(Mandatory = $true,
          HelpMessage = 'Provide the path to an EXE')]
      [ValidateNotNullOrEmpty()]
      [System.IO.FileInfo]$Path
  )

  if (Test-Path $Path) {
      if (Get-Command 'exiftool' -ErrorAction SilentlyContinue) {
          $output = exiftool $Path

          $hash = @{}
          foreach ($line in $output) {
              $IndexColon = $line.IndexOf(':')
              $Property = $line.Substring(0, $IndexColon).Trim()
              $hash[$Property] = ($line.Substring($IndexColon + 1, $line.Length - $IndexColon - 1)).Trim()
          }
          return $hash
          else {
              throw 'Unable to find exiftool command.'
          }
      } else {
          throw 'Unable to find file.'
      }
  }
}