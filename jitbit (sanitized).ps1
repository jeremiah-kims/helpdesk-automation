# ================================
# Configuration (set locally)
# ================================

$ApiToken     = "YOUR_API_TOKEN_HERE"
$ApiBaseUrl   = "https://your-helpdesk-instance/api"
$PollInterval = 30   # seconds between scans
$SeenTicketIDs = @()

# Optional filter (set to $null to disable filtering)
$FilterCompanyID = $null

$Host.UI.RawUI.ForegroundColor = 'Green'

# ================================
# Function: Get tickets from API
# ================================

function Get-Tickets {
    Invoke-RestMethod `
        -Uri "$ApiBaseUrl/tickets?count=100" `
        -Headers @{ Authorization = "Bearer $ApiToken" }
}

# ================================
# Main loop
# ================================

while ($true) {

    $Tickets = Get-Tickets

    # Optional filtering logic
    if ($FilterCompanyID) {
        $FilteredTickets = $Tickets | Where-Object CompanyID -eq $FilterCompanyID
    }
    else {
        $FilteredTickets = $Tickets
    }

    # Detect new tickets
    $NewTickets = $FilteredTickets | Where-Object {
        $_.IssueID -notin $SeenTicketIDs
    }

    if ($NewTickets) {

        Write-Host "New tickets detected!" -ForegroundColor Yellow

        # Popup alert
        Add-Type -AssemblyName PresentationFramework
        [System.Windows.MessageBox]::Show(
            "A new helpdesk ticket has been received.",
            "Ticket Alert",
            'OK',
            'Warning'
        )

        # Display ticket info
        $NewTickets | Format-Table -AutoSize
    }

    # Update seen ticket list
    $SeenTicketIDs = $FilteredTickets.IssueID

    # Countdown progress bar
    for ($i = 1; $i -le $PollInterval; $i++) {

        Write-Progress `
            -Activity "Refreshing tickets" `
            -Status "Next scan in $($PollInterval - $i)s" `
            -PercentComplete ([int](($i / $PollInterval) * 100))

        Start-Sleep -Seconds 1
    }
}

# TODO:
# - Add status-change detection
# - Add sound notifications
# - Add logging support
