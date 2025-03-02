#!/bin/bash

REPO_URL="https://github.com/your-repo/neurogen-core.git"
UPDATE_INTERVAL=1800 # 30 minutes

while true; do
    echo "[AUTO-UPDATE] Checking for updates at \$(date)" >> ~/neurogen/autoupdate.log

    # Fetch latest from remote
    cd ~/neurogen
    git fetch origin main
    LOCAL_HASH=\$(git rev-parse HEAD)
    REMOTE_HASH=\$(git rev-parse origin/main)

    if [ "\$LOCAL_HASH" != "\$REMOTE_HASH" ]; then
        echo "[AUTO-UPDATE] Update found. Pulling..." >> ~/neurogen/autoupdate.log
        git reset --hard origin/main
        docker compose down
        docker compose up -d
        echo "[AUTO-UPDATE] Update applied and services restarted." >> ~/neurogen/autoupdate.log
    else
        echo "[AUTO-UPDATE] No update necessary." >> ~/neurogen/autoupdate.log
    fi

    sleep \$UPDATE_INTERVAL
done
