import requests, time, random
NODES = ["http://node1.ip:port", "http://node2.ip:port", "http://node3.ip:port"]
API_KEY = "YOUR_OPENAI_API_KEY_HERE"
while True:
    alive = [n for n in NODES if requests.get(f"{n}/health").status_code == 200]
    if alive:
        node = random.choice(alive)
        requests.post(f"{node}/execute", json={"task": "trade", "api_key": API_KEY})
    time.sleep(30)
