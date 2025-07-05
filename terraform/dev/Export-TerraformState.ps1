# Variables
$resourceGroup = "RG-ProjectDemo-Dev"
$storageAccount = "projectdemostorage"
$container = "tfstate"
$blobName = "dev.terraform.tfstate"
$exportDir = "."

# # Login if needed
# if (-not (az account show -o none 2 -gt $null)) {
#     Write-Host "Logging in to Azure..."
#     az login --use-device-code
# }

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
    $resourceGroup
