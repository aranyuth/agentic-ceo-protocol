# Agentic CEO Protocol - PowerShell Rule Installer
# Installs core rules into global agent configuration directories.

[CmdletBinding()]
param(
    [switch]$Cursor,
    [string]$TargetDir = ""
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$sourceRulesDir = Join-Path $scriptDir "rules"

if (-not (Test-Path $sourceRulesDir)) {
    Write-Error "Source rules directory not found: $sourceRulesDir"
    exit 1
}

$ruleFiles = Get-ChildItem -Path $sourceRulesDir -Filter "*.md"
if ($ruleFiles.Count -eq 0) {
    Write-Warning "No rule markdown files found in $sourceRulesDir"
    exit 0
}

# Determine default target directories
$destinations = @()

if ($TargetDir -ne "") {
    $destinations += $TargetDir
} else {
    $geminiRulesDir = Join-Path $env:USERPROFILE ".gemini\config\rules"
    $destinations += $geminiRulesDir

    if ($Cursor) {
        $cursorRulesDir = Join-Path $env:USERPROFILE ".cursor\rules"
        $destinations += $cursorRulesDir
    }
}

foreach ($dest in $destinations) {
    if (-not (Test-Path $dest)) {
        Write-Host "Creating directory: $dest"
        New-Item -ItemType Directory -Path $dest -Force | Out-Null
    }

    Write-Host "`nDeploying rules to: $dest"
    foreach ($file in $ruleFiles) {
        $destPath = Join-Path $dest $file.Name
        Copy-Item -Path $file.FullName -Destination $destPath -Force
        Write-Host "  -> Installed: $($file.Name)"
    }
}

Write-Host "`nInstallation completed successfully."
