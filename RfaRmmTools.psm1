# Create a web session
$web = New-Object Net.WebClient


# Load other modules
$OtherModules = @(
    'https://raw.githubusercontent.com/RFAInc/RfaCwaDeploy/master/RfaCwaDeploy.psm1'
)
Foreach ($uri in $OtherModules) {
    $web.DownloadString($uri) | Invoke-Expression
}


# Create generic aliases for vendor-specific functions
New-Alias -Name 'Install-RfaRmmAgent' -Value 'Install-RfaCwaAgent' # Parameter LocationID must be at Position=0
New-Alias -Name 'Uninstall-RfaRmmAgent' -Value 'Uninstall-RfaCwaAgent'


# Load external functions (when you don't need the entire module for a few tasks)
$ExternalFunctions = @(
    'https://raw.githubusercontent.com/tonypags/PsWinAdmin/master/Get-CimLocalDisk.ps1'
)
Foreach ($uri in $ExternalFunctions) {
    $web.DownloadString($uri) | Invoke-Expression
}


# Clean up
$web.Dispose | Out-Null

