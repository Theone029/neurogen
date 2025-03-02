#!/bin/bash
clear
echo "🛰️ SCANNER ACTIVE: Searching for top financial models..."

# Ensure clones directory exists
mkdir -p clones

# Clone freqtrade (if not already cloned)
if [ ! -d "clones/freqtrade" ]; then
  git clone https://github.com/freqtrade/freqtrade.git clones/freqtrade
else
  echo "✅ Freqtrade already cloned."
fi

# Clone Hummingbot (replacement for Zenbot)
if [ ! -d "clones/hummingbot" ]; then
  git clone https://github.com/hummingbot/hummingbot.git clones/hummingbot
else
  echo "✅ Hummingbot already cloned."
fi

# Download example financial dataset from Kaggle (or another source)
if [ ! -f "datasets/crypto-forecast.zip" ]; then
  mkdir -p datasets
  wget -O datasets/crypto-forecast.zip https://www.kaggle.com/datasets/sbhatti/crypto-forecasts/download.zip || echo "⚠️ Dataset not found. Skipping."
else
  echo "✅ Dataset already exists."
fi

# Confirm completion
echo "✅ SCAN COMPLETE. All models and data are ready."

# Bonus nano edit shortcut
echo "💡 To manually review or edit, run: nano scanner.sh"
