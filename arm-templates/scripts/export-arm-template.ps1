# =============================
# Export Azure Resource Group to ARM and convert to Bicep
# =============================

# Load the login check module
Import-Module -Name "./AzureLoginCheck.psm1"

# Run login check and user confirmation
if (-not (Test-AzLoginAndConfirm)) {
    exit 1
}

# -------- Configuration --------
$projectName = "projectdemo"
$resourceGroupEnvironment = "dev"
$resourceGroupPrefix = "rg"
$outputFolder = "../templates"
$exportFileName = "arm-$projectName-$resourceGroupEnvironment.json"
$bicepFileName = "arm-$projectName-$resourceGroupEnvironment.bicep"
$blobName = "$resourceGroupEnvironment.arm.tfstate"
$storageAccountName = "projectdemostorage"
$container = "armstate"
# -------------------------------


# Construct full resource group name
$resourceGroupName = "$resourceGroupPrefix-$projectName-$resourceGroupEnvironment"

# Ensure output folder exists
if (-not (Test-Path -Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

# Set output paths
$exportFilePath = Join-Path $outputFolder $exportFileName
$bicepFilePath = Join-Path $outputFolder $bicepFileName
 

Write-Host "Exporting resource group '$resourceGroupName' to ARM template..."

# Export the ARM template
az group export `
    --name $resourceGroupName `
    --include-comments `
    --include-parameter-default-value `
    > $exportFilePath

if (-not (Test-Path $exportFilePath)) {
    Write-Error "Export failed or file not created."
    exit 1
}

Write-Host "Successfully exported to $exportFilePath"
Write-Host "Converting to Bicep..."

# Convert JSON to Bicep
az bicep decompile --file $exportFilePath --force

if (Test-Path $bicepFilePath) {
    Write-Host "Successfully converted to Bicep: $bicepFilePath"
} else {
    Write-Error "Failed to convert JSON to Bicep."
}

# Get blob properties to extract creation time
Write-Host "Checking for existing blob: $blobName"

$blobProperties = az storage blob show `
    --account-name $storageAccountName `
    --container-name $container `
    --name $blobName | ConvertFrom-Json

if ($blobProperties) {
    $creationTime = $blobProperties.properties.creationTime
    $timestamp = Get-Date $creationTime -Format "yyyy-MM-ddTHH:mm:ss"
    $archivedBlobName = "dev.$timestamp.arm.tfstate"

    Write-Host "Archiving existing blob to: $archivedBlobName"

    # Copy blob to backup name
    az storage blob copy start `
        --account-name $storageAccountName `
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
        --account-name $storageAccountName `
        --container-name $container `
        --name $blobName `
        --auth-mode login `
        --only-show-errors
}
else {
    Write-Host "No existing blob found. Skipping archive."
}

# Upload the file to blob storage
az storage blob upload `
  --account-name $storageAccountName `
  --container-name $container `
  --name $blobName `
  --file $bicepFilePath `
  --auth-mode login

  Write-Host "Completed uploading Bicep file to blob storage: $blobName"