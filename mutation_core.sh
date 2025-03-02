#!/bin/bash
echo "🧬 MUTATION CORE: Optimizing cloned systems..."

sed -i 's/stop_loss: 0.03/stop_loss: 0.015/g' clones/freqtrade/config.json
sed -i 's/period=5m/period=1m/g' clones/zenbot/settings.conf

echo "✅ Mutations applied to cloned strategies."
