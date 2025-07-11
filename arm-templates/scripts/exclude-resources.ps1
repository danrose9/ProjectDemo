param (
    [Parameter(Mandatory = $true)]
    [string]$sourceFile,

    [Parameter(Mandatory = $true)]
    [string]$targetFile,

    [Parameter(Mandatory = $true)]
    [string]$removedFile,

    [Parameter(Mandatory = $true)]
    [string[]]$excludedNamespaces

)

# -------- Process Input --------
$excludedList = $excludedNamespaces.Split(",") | ForEach-Object { $_.Trim() }

# -------- Load Content --------
$bicepLines = Get-Content -Path $sourceFile

# -------- State Holders --------
$insideResourceBlock = $false
$resourceBlock = @()
$outputLines = @()
$removedResources = @()
$bracketDepth = 0

foreach ($line in $bicepLines) {
    $trimmed = $line.Trim()

    if (-not $insideResourceBlock -and $trimmed.StartsWith("resource ")) {
        $insideResourceBlock = $true
        $resourceBlock = @($line)
        $bracketDepth = ($line -split '{').Count - 1 - ($line -split '}').Count + 1
        continue
    }

    if ($insideResourceBlock) {
        $resourceBlock += $line
        $bracketDepth += ($line -split '{').Count - 1
        $bracketDepth -= ($line -split '}').Count - 1

        if ($bracketDepth -le 0) {
            $insideResourceBlock = $false
            $fullBlock = $resourceBlock -join "`n"

            $isExcluded = $false
            foreach ($ns in $excludedList) {
                if ($fullBlock -match [regex]::Escape($ns)) {
                    $isExcluded = $true
                    break
                }
            }

            if ($isExcluded) {
                $cleanResourceLine = $resourceBlock[0] -replace '\s*=\s*{.*$', ''
                $removedResources += $cleanResourceLine.Trim()
            } else {
                $outputLines += $resourceBlock
                $outputLines += ""  # <- Insert a blank line after each resource
            }

            $resourceBlock = @()
            $bracketDepth = 0
        }
    } else {
        $outputLines += $line
    }
}

# -------- Cleanup: Trim extra blank lines --------
# Remove leading/trailing blank lines, then compress any extra consecutive blank lines to a single one
$outputLines = $outputLines `
    | Where-Object { $_ -ne $null } `
    | ForEach-Object { $_.TrimEnd() }

# Ensure max one blank line between blocks
$cleanedLines = @()
$previousLineBlank = $false

foreach ($line in $outputLines) {
    if ($line -eq "") {
        if (-not $previousLineBlank) {
            $cleanedLines += ""
            $previousLineBlank = $true
        }
    } else {
        $cleanedLines += $line
        $previousLineBlank = $false
    }
}

# -------- Write Outputs --------
Set-Content -Path $targetFile -Value $cleanedLines -Encoding UTF8
Set-Content -Path $removedFile -Value $removedResources -Encoding UTF8

Write-Host "`n✅ Filtered Bicep saved to: $targetFile"
Write-Host "🗑️ Removed resource report saved to: $removedFile"
