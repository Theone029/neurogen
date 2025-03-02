#!/bin/bash

LOG_FILE="./miner_watchdog.log"
XMRIG_PATH="/home/assistant/xmrig/build/xmrig" # Update if your path differs
CHECK_INTERVAL=60 # seconds

echo "🛡️ NEUROGEN Miner Watchdog Activated." | tee -a $LOG_FILE

while true
do
    if pgrep -x "xmrig" > /dev/null
    then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ✅ XMRig is running." >> $LOG_FILE
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - ❌ XMRig stopped. Restarting..." | tee -a $LOG_FILE
        nohup $XMRIG_PATH -c /home/assistant/xmrig/build/config.json > /dev/null 2>&1 &
        echo "$(date '+%Y-%m-%d %H:%M:%S') - 🔄 XMRig restarted." >> $LOG_FILE
    fi
    sleep $CHECK_INTERVAL
done
