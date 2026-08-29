[CmdletBinding()]
param()

$sourcePath = Join-Path -Path $PSScriptRoot -ChildPath 'src\checklists.json'
$destinationPattern = 'C:\Users\alexc\Desktop\msfs2024 addons\Liveries\Synaptic A220\*\Config\*'

if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
    throw "Source file was not found: $sourcePath"
}

$destinations = @(
    Get-ChildItem -Path $destinationPattern -Directory -Force -ErrorAction SilentlyContinue
)

if ($destinations.Count -eq 0) {
    Write-Error "No matching destination directories were found: $destinationPattern"
    exit 1
}

$copied = 0
$failed = 0

foreach ($destination in $destinations) {
    try {
        $targetPath = Join-Path -Path $destination.FullName -ChildPath 'checklists.json'
        Copy-Item -LiteralPath $sourcePath -Destination $targetPath -Force -ErrorAction Stop
        Write-Host "Copied to $targetPath" -ForegroundColor Green
        $copied++
    }
    catch {
        Write-Error "Failed to copy to $($destination.FullName): $($_.Exception.Message)"
        $failed++
    }
}

Write-Host "Copied checklists.json to $copied destination director$(if ($copied -eq 1) { 'y' } else { 'ies' })."

if ($failed -gt 0) {
    Write-Error "$failed destination(s) failed."
    exit 1
}
