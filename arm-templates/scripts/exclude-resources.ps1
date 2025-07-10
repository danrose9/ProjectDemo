# ================================
# Filter Bicep File by Excluded Namespaces
# ================================

# -------- Configuration --------
$sourceFile = "../templates/arm-projectdemo-dev.bicep"
$targetFile = "../templates/filtered.bicep"
$removedFile = "removed-resources.txt"

# Add as many namespaces as needed here
$excludedNamespaces = @(
    "Microsoft.OperationalInsights",
    "microsoft.insights"  # Example: add more if needed
)

# -------- Load Content --------
$bicepLines = Get-Content -Path $sourceFile

# -------- State Holders --------
$insideResourceBlock = $false
$resourceLines = @()
$outputLines = @()
$removedResources = @()
$currentResource = @()

foreach ($line in $bicepLines) {
    # Detect start of a resource block
    if ($line.Trim().StartsWith("resource ")) {
        $insideResourceBlock = $true
        $currentResource = @($line)
        continue
    }

    if ($insideResourceBlock) {
        $currentResource += $line

        # End of resource block
        if ($line.Trim() -match '^\}') {
            $insideResourceBlock = $false
            $resourceBlock = $currentResource -join "`n"

            $isExcluded = $false
            foreach ($ns in $excludedNamespaces) {
                if ($resourceBlock -match [regex]::Escape($ns)) {
                    $isExcluded = $true
                    break
                }
            }

            if ($isExcluded) {
                # Capture the first line (resource definition only) for the report
                $removedResources += $currentResource[0].Trim()
            } else {
                $outputLines += $currentResource
            }

            $currentResource = @()
        }
    }
    else {
        # Not inside a resource, just add to output (params etc.)
        $outputLines += $line
    }
}

# -------- Write Outputs --------
Set-Content -Path $targetFile -Value $outputLines -Encoding UTF8
Set-Content -Path $removedFile -Value $removedResources -Encoding UTF8

Write-Host "✅ Filtered Bicep saved to: $targetFile"
Write-Host "🗑️ Removed resource report saved to: $removedFile"
