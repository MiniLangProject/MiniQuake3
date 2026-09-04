[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
python (Join-Path $PSScriptRoot 'scripts/build.py')
if ($LASTEXITCODE -ne 0) { throw 'MiniQuake3 build failed' }
