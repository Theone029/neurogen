import subprocess, time, openai

API_KEY = "YOUR_KRAKEN_API_KEY_HERE"
HEADERS = {"Authorization": f"Bearer {API_KEY}"}

def check_logs():
    result = subprocess.run(["docker", "logs", "--tail", "100", "freqtrade"], capture_output=True, text=True)
    return result.stdout

def fix_issue(logs):
    prompt = f"Analyze these Freqtrade logs and give me a ONE-LINE fix command only:\n{logs}"
    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[{"role": "user", "content": prompt}],
        headers=HEADERS
    )
    return response.choices[0].message['content']

while True:
    logs = check_logs()
    fix = fix_issue(logs)
    subprocess.run(fix, shell=True)
    time.sleep(300)  # Check every 5 minutes

