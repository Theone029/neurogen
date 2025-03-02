#!/bin/bash

while true; do
    clear
    echo -e "\e[1;35m"
    echo "███████╗███╗   ██╗███████╗██████╗  ██████╗  ██████╗ ███╗   ██╗"
    echo "██╔════╝████╗  ██║██╔════╝██╔══██╗██╔═══██╗██╔═══██╗████╗  ██║"
    echo "█████╗  ██╔██╗ ██║█████╗  ██████╔╝██║   ██║██║   ██║██╔██╗ ██║"
    echo "██╔══╝  ██║╚██╗██║██╔══╝  ██╔═══╝ ██║   ██║██║   ██║██║╚██╗██║"
    echo "███████╗██║ ╚████║███████╗██║     ╚██████╔╝╚██████╔╝██║ ╚████║"
    echo "╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝"
    echo -e "\e[0m"
    echo -e "\e[1;32m🧠 NEUROGEN INFINITE DOMINO CONSOLE v7\e[0m"
    echo "───────────────────────────────────────────────────────────────"
    echo -e "\e[36m[1]\e[0m Start Mining 🚀"
    echo -e "\e[36m[2]\e[0m Inject Affiliate IDs 🪄"
    echo -e "\e[36m[3]\e[0m Launch API Revenue 📄"
    echo -e "\e[36m[4]\e[0m Deploy New VPS Node 🌐"
    echo -e "\e[36m[5]\e[0m Run Full System Backup 💾"
    echo -e "\e[36m[6]\e[0m Activate Stealth Mode 🕵️"
    echo -e "\e[36m[7]\e[0m Check Mining Payouts 💰"
    echo -e "\e[36m[8]\e[0m Exit 🛑"
    echo -e "\e[36m[9]\e[0m Open Status Dashboard 📊"
    echo "───────────────────────────────────────────────────────────────"
    echo -e "\e[33m[SECRET CODES: 42 | 777 | 999 | 404 | 0]\e[0m"
    read -p "💡 Choose your next domino to push: " choice

    case $choice in
        1)
            echo -e "\e[32m🔥 Launching Mining Engine...\e[0m"
            nohup ./xmrig > mining.log 2>&1 &
            ;;
        2)
            echo -e "\e[32m🪄 Injecting Affiliate Placeholders...\e[0m"
            echo "AMAZON_ID=PLACEHOLDER" > affiliate_ids.txt
            echo "EBAY_ID=PLACEHOLDER" >> affiliate_ids.txt
            ;;
        3)
            echo -e "\e[32m📄 Deploying API Revenue Generator...\e[0m"
            nohup ./neurogen_api_revenue.sh > api_revenue.log 2>&1 &
            ;;
        4)
            echo -e "\e[32m🌐 Initializing VPS Node Deployment...\e[0m"
            bash vps_deploy.sh
            ;;
        5)
            echo -e "\e[32m💾 Backing up system state...\e[0m"
            tar -czvf neurogen_backup_$(date +%F).tar.gz ~/neurogen
            ;;
        6)
            echo -e "\e[32m🕵️ Engaging Stealth Protocols...\e[0m"
            mv xmrig winupdate
            echo "Process cloaked as 'winupdate'"
            ;;
        7)
            echo -e "\e[32m💰 Fetching payout data...\e[0m"
            curl -s https://hashvault.pro/api/stats_address?address=YOUR_WALLET_ADDRESS | jq
            ;;
        8)
            echo -e "\e[31m🛑 Exiting NEUROGEN DOMINO CONSOLE. Standby for future activation.\e[0m"
            break
            ;;
        9)
            echo -e "\e[34m📊 Launching Status Dashboard in tmux...\e[0m"
            if ! tmux has-session -t neurogen 2>/dev/null; then
                echo -e "\e[33m🔄 Starting new tmux session 'neurogen'...\e[0m"
                tmux new-session -d -s neurogen "bash ./neurogen_status_dashboard.sh"
            else
                tmux send-keys -t neurogen "bash ./neurogen_status_dashboard.sh" C-m
            fi
            echo -e "\e[32m✅ Attaching to Status Dashboard now...\e[0m"
            sleep 1
            tmux attach-session -t neurogen
            ;;

        # 🔥 SECRET MODES 🔥
        42)
            echo -e "\e[35m🧠 The secret to life, the universe, and everything... is NEUROGEN.\e[0m"
            ;;
        777)
            echo -e "\e[33m🍀 LUCKY STRIKE! Deploying surprise revenue op.\e[0m"
            bash random_revenue_op.sh
            ;;
        999)
            echo -e "\e[31m💥 NUCLEAR MODE ACTIVATED. All systems launching.\e[0m"
            nohup ./xmrig > mining.log 2>&1 &
            nohup ./neurogen_api_revenue.sh > api_revenue.log 2>&1 &
            bash vps_deploy.sh
            ;;
        404)
            echo -e "\e[36m🕶️ Cloaking all visible processes... stealth mode max.\e[0m"
            pkill -f xmrig
            mv xmrig winupdate
            ;;
        0)
            echo -e "\e[31m❌ IMMEDIATE SYSTEM HALT. Stopping all active processes.\e[0m"
            pkill -f xmrig
            pkill -f neurogen_api_revenue.sh
            ;;
        *)
            echo -e "\e[31m❌ Invalid choice. Try again.\e[0m"
            ;;
    esac
    read -p "🔁 Press [Enter] to continue..."
done
