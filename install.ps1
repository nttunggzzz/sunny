# ========================================================
# Sunny ☀️ - 1-Click Installer (Windows PowerShell)
# ========================================================

Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "   Sunny ☀️ - Brain & Muscle Multi-Agent" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host ""

# 1. Verify Python
$PythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $PythonCmd) {
    $PythonCmd = Get-Command py -ErrorAction SilentlyContinue
}

if (-not $PythonCmd) {
    Write-Host "[Error] Python not found. Please install Python 3.10+ from python.org." -ForegroundColor Red
    Exit 1
}

Write-Host "[✓] Python detected: $($PythonCmd.Source)" -ForegroundColor Green

# 2. Virtual Environment Setup
if (-not (Test-Path ".venv")) {
    Write-Host "[+] Creating virtual environment (.venv)..." -ForegroundColor Gray
    & $PythonCmd.Source -m venv .venv
}

Write-Host "[+] Installing dependencies..." -ForegroundColor Gray
& .\.venv\Scripts\python.exe -m pip install -q -U pip
& .\.venv\Scripts\python.exe -m pip install -q -r requirements.txt
Write-Host "[✓] Dependencies installed." -ForegroundColor Green

# 3. Configure .env
if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host "[✓] Initialized .env template." -ForegroundColor Green
}

# 4. Register Skills with Antigravity (Global)
$AgySkillsDir = Join-Path $HOME ".gemini\config\skills"
if (-not (Test-Path $AgySkillsDir)) {
    New-Item -ItemType Directory -Path $AgySkillsDir -Force | Out-Null
}

$BrainMuscleDest = Join-Path $AgySkillsDir "brain-muscle"
$PonytailDest = Join-Path $AgySkillsDir "ponytail"

Copy-Item -Recurse -Force "skills\brain-muscle" $BrainMuscleDest
Copy-Item -Recurse -Force "skills\ponytail" $PonytailDest

Write-Host "[✓] Skills registered globally to: $AgySkillsDir" -ForegroundColor Green
Write-Host ""
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "  Setup Complete! ☀️" -ForegroundColor Green
Write-Host "  Start Antigravity and type: 'Sunny mode'" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Yellow
