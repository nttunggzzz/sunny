#!/usr/bin/env bash
# ========================================================
# Sunny ☀️ - 1-Click Installer (macOS & Linux)
# ========================================================

set -e

echo -e "\033[1;33m==========================================\033[0m"
echo -e "\033[1;36m   Sunny ☀️ - Brain & Muscle Multi-Agent\033[0m"
echo -e "\033[1;33m==========================================\033[0m"
echo ""

# 1. Verify Python
if command -v python3 &>/dev/null; then
    PYTHON_CMD="python3"
elif command -v python &>/dev/null; then
    PYTHON_CMD="python"
else
    echo -e "\033[1;31m[Error] Python not found. Please install Python 3.10+.\033[0m"
    exit 1
fi

echo -e "\033[1;32m[✓] Python detected: $($PYTHON_CMD --version)\033[0m"

# 2. Virtual Environment Setup
if [ ! -d ".venv" ]; then
    echo -e "\033[0;37m[+] Creating virtual environment (.venv)...\033[0m"
    $PYTHON_CMD -m venv .venv
fi

echo -e "\033[0;37m[+] Installing dependencies...\033[0m"
.venv/bin/python -m pip install -q -U pip
.venv/bin/python -m pip install -q -r requirements.txt
echo -e "\033[1;32m[✓] Dependencies installed.\033[0m"

# 3. Configure .env
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo -e "\033[1;32m[✓] Initialized .env template.\033[0m"
fi

# 4. Register Skills with Antigravity (Global)
AGY_SKILLS_DIR="$HOME/.gemini/config/skills"
mkdir -p "$AGY_SKILLS_DIR"

cp -r "skills/brain-muscle" "$AGY_SKILLS_DIR/"
cp -r "skills/ponytail" "$AGY_SKILLS_DIR/"

echo -e "\033[1;32m[✓] Skills registered globally to: $AGY_SKILLS_DIR\033[0m"
echo ""
echo -e "\033[1;33m==========================================\033[0m"
echo -e "\033[1;32m  Setup Complete! ☀️\033[0m"
echo -e "\033[1;36m  Start Antigravity and type: 'Sunny mode'\033[0m"
echo -e "\033[1;33m==========================================\033[0m"
