#!/bin/bash
while true; do
  echo "[HARVEST] Scanning for new repositories..."
  git clone $(curl -s https://api.github.com/search/repositories?q=trading+bot+stars:>500 | grep -oP '(?<="clone_url": ")[^"]*') ~/neurogen/clones/
  sleep 86400
done
