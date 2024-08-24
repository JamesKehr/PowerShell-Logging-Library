using module ..\libLogging.psm1

[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $LogPath = "C:\Temp",

    [switch]
    $NoWrite,

    [switch]
    $WriteError,

    [switch]
    $NonTerminating
)

begin {
    Start-Logging -ModuleName "Test" -LogPath $LogPath
    Write-Log "Begin - Start"
    Write-LogWarning "Some text." -Code "Test"
    Write-Log "Begin - End"
}

process {

    Write-Log "Process - Start"

    if ($WriteError.IsPresent) {
        if ($NonTerminating.IsPresent) {
            Write-LogError -Text "Throwing a non-terminating error." -Code "Test" -NonTerminating
        } else {
            Write-LogError -Text "Throwing a terminating error." -Code "Test"
        }
        
    }

    Write-Log "Process - End"
}

end {
    Write-Log "End - Start"
    Write-Log "End - End"
    Close-Logging -ModuleName "Test"
}
