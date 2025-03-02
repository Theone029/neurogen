#!/bin/bash

while true; do
    echo "[SENTINEL] Running system check..."

    # Check for docker errors
    if ! docker ps > /dev/null 2>&1; then
        echo "[SENTINEL] Docker failed. Restarting..."
        systemctl restart docker
    fi

    # Check Freqtrade status
    if ! docker ps | grep -q freqtrade; then
        echo "[SENTINEL] Freqtrade down. Relaunching..."
        docker compose down
        docker compose up -d
    fi

    # Log timestamp
    echo "[SENTINEL] All systems nominal at $(date)" >> ~/neurogen/sentinel.log

    sleep 60
done
