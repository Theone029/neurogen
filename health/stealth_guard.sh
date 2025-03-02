#!/bin/bash
sudo ufw enable
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo fail2ban-client start
