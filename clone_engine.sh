#!/bin/bash
echo "🛠️ CLONE ENGINE: Deploying cloned financial models..."

cd clones/freqtrade && ./start.sh &
cd clones/zenbot && ./launch.sh &
unzip datasets/download.zip -d datasets/

echo "✅ Cloned systems are running."
