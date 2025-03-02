#!/bin/bash
echo "🌐 FRACTAL SCALER: Preparing VPS deployments..."

bash deploy_to_vps.sh clones/freqtrade
bash deploy_to_vps.sh clones/zenbot

echo "✅ Scaling to global nodes."
