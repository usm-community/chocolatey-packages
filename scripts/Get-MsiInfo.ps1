function Get-MsiInfo {
  param(
      [parameter(Mandatory = $true,
          HelpMessage = 'Provide the path to an MSI')]
      [ValidateNotNullOrEmpty()]
      [System.IO.FileInfo]$Path
  )

  if (Test-Path $Path) {
      if (Get-Command 'msiinfo' -ErrorAction SilentlyContinue) {
          $output = msiinfo export $Path Property

          $hash = @{}
          $regex = '^(UpgradeCode|ProductCode|ProductLanguage|ProductName|ProductVersion|Manufacturer)'
          foreach ($line in $output) {
              if ($line -match $regex) {
                  $SplitLine = $line.Split("`t")
                  $hash[$SplitLine[0]] = $SplitLine[1]
              }
          }
          return $hash
          else {
              throw 'Unable to find msiinfo command.'
          }
      } else {
          throw 'Unable to find file.'
      }
  }
}