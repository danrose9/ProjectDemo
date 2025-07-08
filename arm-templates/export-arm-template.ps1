# =============================
# Export Azure Resource Group to ARM and convert to Bicep
# =============================

# Load the login check module
Import-Module -Name "./modules/AzureLoginCheck.psm1"

# Run login check and user confirmation
if (-not (Test-AzLoginAndConfirm)) {
    exit 1
}

# -------- Configuration --------
$projectName = "projectdemo"
$resourceGroupEnvironment = "dev"
$resourceGroupPrefix = "rg"
$outputFolder = "./export"
$exportFileName = "arm-$projectName-$resourceGroupEnvironment.json"
$bicepFileName = "arm-$projectName-$resourceGroupEnvironment.bicep"
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
az bicep decompile --file $exportFilePath

if (Test-Path $bicepFilePath) {
    Write-Host "Successfully converted to Bicep: $bicepFilePath"
} else {
    Write-Error "Failed to convert JSON to Bicep."
}

