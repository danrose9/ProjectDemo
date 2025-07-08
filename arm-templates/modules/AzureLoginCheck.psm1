function Test-AzLoginAndConfirm {
    <#
    .SYNOPSIS
        Checks if the user is logged into Azure and prompts for confirmation to continue.

    .DESCRIPTION
        Uses `az account show` to get login details, then prompts the user.
        Hitting Enter (blank input) counts as 'yes'.

    .OUTPUTS
        Boolean (True if confirmed, otherwise exits)

    .NOTES
        Author: Dan Rose
    #>

    try {
        # Get current Azure login details
        $account = az account show --output json | ConvertFrom-Json
        $user = $account.user.name
        $subscription = $account.name

        # Confirmation prompt
        $message = "You are logged in as '$user' with Subscription '$subscription'. Do you wish to continue? (Y/N) [Y]: "
        $response = Read-Host $message

        if ($response -and $response.ToLower() -ne 'y') {
            Write-Host "Operation cancelled by user." -ForegroundColor Yellow
            exit 1
        }

        Write-Host "Continuing..." -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Not logged into Azure CLI. Please run 'az login' and try again." -ForegroundColor Red
        exit 1
    }
}
