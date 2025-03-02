#!/bin/bash
set -e

echo "🚀 NEUROGEN BOOTSTRAP INITIATED..."

# System prep
apt update && apt upgrade -y
apt install -y docker.io docker-compose git curl python3-pip tmux

# Clone Neurogen core (optional if not already present)
if [ ! -d "~/neurogen" ]; then
    git clone https://github.com/your-repo/neurogen.git ~/neurogen
fi

# Pull latest containers
docker compose -f ~/neurogen/docker-compose.yml down || true
docker compose -f ~/neurogen/docker-compose.yml up -d --build

# Inject Golden Configs
mkdir -p ~/neurogen/clones/freqtrade/user_data/strategies
cp ~/neurogen/golden/config.json ~/neurogen/clones/freqtrade/user_data/config.json
cp ~/neurogen/golden/NeuroStrike.py ~/neurogen/clones/freqtrade/user_data/strategies/NeuroStrike.py
chmod +x ~/neurogen/clones/freqtrade/user_data/strategies/NeuroStrike.py

# Activate Sentinel
chmod +x ~/neurogen/sentinel.sh
nohup ~/neurogen/sentinel.sh > ~/neurogen/sentinel.log 2>&1 &

# Optional Mining (uncomment to activate)
# bash ~/neurogen/miner_start.sh

# Auto-start on reboot
(crontab -l 2>/dev/null; echo "@reboot bash ~/neurogen/bootstrap.sh") | crontab -

echo "✅ NEUROGEN NODE READY AND LIVE!"
