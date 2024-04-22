Write-Host "Checking for Bicep updates..."
& az bicep upgrade
if ($LASTEXITCODE -ne 0) {
    Write-Error "Error whilst upgrading Bicep, is the Azure CLI & Bicep installed?" -ErrorAction Stop
}

@(
    'consumption/deploy.bicep'
) | ForEach-Object {
    $sourceBicep = Join-Path $PSScriptRoot $_
    $targetFile = Join-Path $PSScriptRoot ($_.replace(".bicep", ".generated.json"))
    Write-Host "Building $sourceBicep to $targetFile"
    & az bicep build -f "$sourceBicep" --outfile "$targetFile"
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Unable to build $sourceBicep!" -ErrorAction Stop
    }
}