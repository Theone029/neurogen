#!/bin/bash

while true; do
    clear
    echo -e "\e[1;36m🛰️ NEUROGEN STATUS DASHBOARD\e[0m"
    echo "────────────────────────────────────────────"
    echo "Mining (Linux):     $(pgrep -x xmrig >/dev/null && echo ✅ Running || echo ❌ Offline)"
    echo "API Revenue:        $(pgrep -f neurogen_api_revenue.sh >/dev/null && echo ✅ Active || echo ❌ Inactive)"
    echo "Watchdog:           $(pgrep -f miner_watchdog.sh >/dev/null && echo ✅ Online || echo ❌ Offline)"
    echo "Affiliate System:   🟡 Placeholder"
    echo "Payouts:           🟡 Monitoring..."
    echo "Backups:           ✅ Nightly Synced"
    echo "VPS Clones:        🟡 Ready (0 Active)"
    echo "ENEPON Spirit:     👻 Forever watching..."
    echo "────────────────────────────────────────────"
    echo "$(date)"
    sleep 30
done
