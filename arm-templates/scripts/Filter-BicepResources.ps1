<#
.SYNOPSIS
    Filters a Bicep file by including or excluding resources based on their namespace.

.DESCRIPTION
    This script scans a Bicep (.bicep) template and removes resource blocks based on matching namespace filters.
    You can specify namespaces to include via `-includedNamespaces` and/or exclude via `-excludedNamespaces`.

    Examples:
        .\exclude-resources.ps1 -sourceFile ".\input.bicep" -targetFile ".\output.bicep" -removedFile ".\removed.txt" `
            -includedNamespaces "Microsoft.Sql/servers" `
            -excludedNamespaces "Microsoft.Sql/servers/advisors", "Microsoft.Sql/servers/advancedThreatProtectionSettings"

    Behaviour:
        - If only `-includedNamespaces` is used, only those resources are kept.
        - If only `-excludedNamespaces` is used, everything is kept except those excluded.
        - If both are specified, only resources in `includedNamespaces` are kept — unless they also match `excludedNamespaces`, which always take priority.
        - Parameters and non-resource elements are preserved.
        - A report is written to the removed file showing the names of all excluded resources.

.NOTES
    Author: Dan Rose
#>


param (
    [Parameter(Mandatory = $true)]
    [string]$sourceFile,

    [Parameter(Mandatory = $true)]
    [string]$targetFile,

    [Parameter(Mandatory = $true)]
    [string]$removedFile,

    [string[]]$excludedNamespaces = @(),

    [string[]]$includedNamespaces = @()
)

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
            
            # Extract resource type from declaration line
            $resourceDeclarationLine = $resourceBlock[0]
            $resourceTypeMatch = [regex]::Match($resourceDeclarationLine, "'([^']+?)@")
            $resourceType = $resourceTypeMatch.Groups[1].Value

            # Do the actual filtering
            $includeMatch = ($includedNamespaces.Count -eq 0) -or ($includedNamespaces | Where-Object { $resourceType -like "$_*" }).Count -gt 0
            $excludeMatch = ($excludedNamespaces | Where-Object { $resourceType -like "$_*" }).Count -gt 0


            $shouldInclude = $true

            if ($includedNamespaces.Count -gt 0 -and $excludedNamespaces.Count -eq 0) {
                $shouldInclude = $includeMatch
            }
            elseif ($excludedNamespaces.Count -gt 0 -and $includedNamespaces.Count -eq 0) {
                $shouldInclude = -not $excludeMatch
            }
            elseif ($includedNamespaces.Count -gt 0 -and $excludedNamespaces.Count -gt 0) {
                # Include only if it's in include list AND not in exclude list
                $shouldInclude = $includeMatch -and -not $excludeMatch
            }

            if ($shouldInclude) {
                $outputLines += $resourceBlock
                $outputLines += ""  # insert blank line between resources
            } else {
                $cleanResourceLine = $resourceBlock[0] -replace '\s*=\s*{.*$', ''
                $removedResources += $cleanResourceLine.Trim()
            }

            $resourceBlock = @()
            $bracketDepth = 0
        }
    } else {
        $outputLines += $line
    }
}

# -------- Cleanup: Remove extra blank lines --------
$outputLines = $outputLines `
    | Where-Object { $_ -ne $null } `
    | ForEach-Object { $_.TrimEnd() }

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
