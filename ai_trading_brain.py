#!/usr/bin/env python3

import os, time, openai, json, subprocess

openai.api_key = "YOUR_OPENAI_API_KEY_HERE"
CONFIG_PATH = "/home/assistant/neurogen/clones/freqtrade/user_data/config.json"
CHECK_INTERVAL = 3600  # 1 hour

def get_market_data():
    result = subprocess.run(["docker", "exec", "freqtrade", "freqtrade", "list-markets"], stdout=subprocess.PIPE)
    return result.stdout.decode()

def ai_strategy_optimizer(market_data):
    prompt = f"Analyze this market data and suggest optimized config parameters for Freqtrade to maximize profit:\n\n{market_data}\n\nRespond with a valid JSON to update config.json."
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=1000
    )
    return response.choices[0].text.strip()

def update_config(new_config_json):
    try:
        new_config = json.loads(new_config_json)
        with open(CONFIG_PATH, "w") as f:
            json.dump(new_config, f, indent=4)
        os.system("docker compose restart freqtrade")
        print("[AI TRADING BRAIN] Config updated and freqtrade restarted.")
    except json.JSONDecodeError:
        print("[AI TRADING BRAIN] Invalid JSON received, skipping...")

while True:
    print("[AI TRADING BRAIN] Gathering market data...")
    market_data = get_market_data()
    print("[AI TRADING BRAIN] Optimizing strategy with AI...")
    optimized_config = ai_strategy_optimizer(market_data)
    update_config(optimized_config)
    time.sleep(CHECK_INTERVAL)
