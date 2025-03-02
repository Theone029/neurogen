#!/bin/bash
for strategy in /home/assistant/neurogen/clones/freqtrade/user_data/strategies/*.py; do
    docker exec freqtrade freqtrade hyperopt \
        --strategy $(basename "$strategy" .py) \
        --config /freqtrade/config.json \
        --spaces all \
        --epochs 50
done
