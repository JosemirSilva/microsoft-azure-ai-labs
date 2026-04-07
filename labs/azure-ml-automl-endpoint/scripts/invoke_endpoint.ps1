# Invoca o Managed Online Endpoint usando endpoint.json + sample-request.json.
# Pré-requisito: $env:AZURE_ML_API_KEY com a chave primária ou secundária (Studio > Endpoints > Consume).

$ErrorActionPreference = "Stop"
$labRoot = Split-Path -Parent $PSScriptRoot
Set-Location $labRoot

$endpointPath = Join-Path $labRoot "endpoint.json"
$samplePath = Join-Path $labRoot "sample-request.json"

if (-not (Test-Path $endpointPath)) { throw "Arquivo nao encontrado: $endpointPath" }
if (-not (Test-Path $samplePath)) { throw "Arquivo nao encontrado: $samplePath" }

$key = $env:AZURE_ML_API_KEY
if ([string]::IsNullOrWhiteSpace($key)) {
    throw "Defina a variavel de ambiente AZURE_ML_API_KEY (chave do endpoint)."
}

$cfg = Get-Content -Raw $endpointPath | ConvertFrom-Json
$uri = $cfg.scoring_uri
if ($uri -match "^<substituir" -or [string]::IsNullOrWhiteSpace($uri)) {
    throw "Atualize scoring_uri em endpoint.json com a URI do Studio (aba Consume)."
}

$body = Get-Content -Raw $samplePath
$headers = @{
    "Content-Type"  = "application/json"
    "Authorization" = "Bearer $key"
}
$deploy = $cfg.deployment_name
if (-not [string]::IsNullOrWhiteSpace($deploy) -and $deploy -notmatch "^<substituir") {
    $headers["azureml-model-deployment"] = $deploy
}

Invoke-RestMethod -Uri $uri -Method Post -Headers $headers -Body $body
