#!/usr/bin/env python3

import os, time, openai, subprocess

openai.api_key = "YOUR_OPENAI_API_KEY_HERE"
LOG_FILE = "/var/log/syslog"
CHECK_INTERVAL = 1800  # 30 mins

def tail_log():
    return subprocess.run(["tail", "-n", "100", LOG_FILE], stdout=subprocess.PIPE).stdout.decode()

def analyze_logs(logs):
    prompt = f"Analyze the following system logs and identify any errors, issues, or optimizations needed. Provide exact shell commands to fix them:\n\n{logs}"
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt=prompt,
        max_tokens=500
    )
    return response.choices[0].text.strip()

def execute_fixes(commands):
    for cmd in commands.split('\n'):
        if cmd.strip():
            os.system(cmd)

while True:
    logs = tail_log()
    print("[AI DIAGNOSTICS] Analyzing logs...")
    fixes = analyze_logs(logs)
    print(f"[AI DIAGNOSTICS] Suggested fixes:\n{fixes}")
    with open("/neurogen/ai_fixes.log", "a") as f:
        f.write(f"---\n{time.ctime()}\n{fixes}\n")
    execute_fixes(fixes)
    time.sleep(CHECK_INTERVAL)
