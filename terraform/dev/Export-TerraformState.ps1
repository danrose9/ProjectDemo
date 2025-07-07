# Variables
$resourceGroup = "RG-ProjectDemo-Dev"
$storageAccount = "projectdemostorage"
$container = "tfstate"
$blobName = "dev.terraform.tfstate"
$exportDir = "."

try {
    # Get current Azure login details
    $account = az account show --output json | ConvertFrom-Json
    $user = $account.user.name
    $subscription = $account.name

    # Confirmation prompt
    $message = "You are logged in as '$user' with Subscription '$subscription'. Do you wish to continue? (Y/N): "
    $response = Read-Host $message

    if ($response -ne 'Y' -and $response -ne 'y') {
        Write-Host "Operation cancelled by user." -ForegroundColor Yellow
        exit 1
    }

    Write-Host "Continuing..." -ForegroundColor Green
}
catch {
    Write-Host "Not logged into Azure CLI. Please run 'az login' and try again." -ForegroundColor Red
    exit 1
}

# Get blob properties to extract creation time
Write-Host "Checking for existing blob: $blobName"
$blobProperties = az storage blob show `
    --account-name $storageAccount `
    --container-name $container `
    --name $blobName | ConvertFrom-Json

if ($blobProperties) {
    $creationTime = $blobProperties.properties.creationTime
    $timestamp = Get-Date $creationTime -Format "yyyy-MM-ddTHH:mm:ss"
    $archivedBlobName = "dev.$timestamp.terraform.tfstate"

    Write-Host "Archiving existing blob to: $archivedBlobName"

    # Copy blob to backup name
    az storage blob copy start `
        --account-name $storageAccount `
        --destination-blob $archivedBlobName `
        --destination-container $container `
        --source-blob $blobName `
        --source-container $container `
        --auth-mode login `
        --only-show-errors

    # Wait a moment to ensure copy is committed
    Start-Sleep -Seconds 5

    # Delete the original blob
    az storage blob delete `
        --account-name $storageAccount `
        --container-name $container `
        --name $blobName `
        --auth-mode login `
        --only-show-errors
}
else {
    Write-Host "No existing blob found. Skipping archive."
}

# Run aztfexport
Write-Host "Running aztfexport for resource group: $resourceGroup"
aztfexport resource-group `
    --non-interactive `
    --output-dir $exportDir `
    --overwrite `
    --exclude-azure-resource-file .\excluded-resources.txt `
    $resourceGroup
