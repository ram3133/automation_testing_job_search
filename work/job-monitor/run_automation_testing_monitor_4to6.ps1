$ErrorActionPreference = "Stop"

# Automation Testing lane, narrowed to roughly 4 to 6 years.
# This wrapper keeps the main monitor logic intact and only adjusts the profile and notification target.
$env:ROLEPILOT_PROFILE = "automation-testing"
$env:ROLEPILOT_MIN_YEARS = if ($env:ROLEPILOT_MIN_YEARS) { [string]$env:ROLEPILOT_MIN_YEARS } else { "4" }
$env:ROLEPILOT_MAX_YEARS = if ($env:ROLEPILOT_MAX_YEARS) { [string]$env:ROLEPILOT_MAX_YEARS } else { "6" }
$env:ROLEPILOT_WRITE_APP_OUTPUTS = "false"

if (-not $env:ROLEPILOT_NTFY_TOPIC) {
  $env:ROLEPILOT_NTFY_TOPIC = "https://ntfy.sh/automation_testing"
}

& (Join-Path $PSScriptRoot "run_gcc_product_monitor.ps1")
