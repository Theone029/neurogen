import openai, time, os
openai.api_key = "YOUR_OPENAI_API_KEY_HERE"
def regenerate_strategy():
    prompt = "Rewrite NeuroStrike.py for maximum profit in current market conditions, optimized for Kraken, USD pairs, 5m timeframe."
    response = openai.Completion.create(engine="text-davinci-003", prompt=prompt, max_tokens=2500)
    with open("/home/assistant/neurogen/clones/freqtrade/user_data/strategies/NeuroStrike.py", "w") as f:
        f.write(response.choices[0].text)
while True:
    regenerate_strategy()
    os.system("docker compose restart freqtrade")
    time.sleep(86400)
