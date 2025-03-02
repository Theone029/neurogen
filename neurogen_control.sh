#!/bin/bash
case $1 in
  ignite)
    echo "[NEUROGEN] Igniting systems..."
    docker compose -f ~/neurogen/docker/docker-compose.yml up -d
    nohup bash ~/neurogen/harvest/harvest_engine.sh &
    bash ~/neurogen/mutation/mutation_engine.sh
    bash ~/neurogen/scale/auto_vps_scaler.sh
    bash ~/neurogen/health/stealth_guard.sh
    ;;
  status)
    docker ps
    ;;
  *)
    echo "Usage: $0 {ignite|status}"
    ;;
esac
