# =============================
# Export Azure Resource Group to ARM and convert to Bicep
# =============================

# -------- Configuration --------
$outputFolder = "."
$exportFileName = "arm-projectdemo-dev.json"
# -------------------------------



# Set output paths
$exportFilePath = Join-Path $outputFolder $exportFileName
$bicepFilePath = Join-Path $outputFolder $bicepFileName

Write-Host "Converting to Bicep..."

# Convert JSON to Bicep
az bicep decompile --file $exportFilePath

if (Test-Path $bicepFilePath) {
    Write-Host "Successfully converted to Bicep: $bicepFilePath"
} else {
    Write-Error "Failed to convert JSON to Bicep."
}

