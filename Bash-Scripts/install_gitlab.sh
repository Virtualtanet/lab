#!/bin/bash
# Create New Bash Scrip for UFW
# Remove OpenSSH add only HTTP & HTTPS

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

# refresh your system's package index
sudo apt update
aecho -e $TEXT_YELLOW
echo 'refesh apt completed...'
echo -e $TEXT_RESET

# install the depcendencies
sudo apt install ca-certificates curl openssh-server postfix
echo -e $TEXT_YELLOW
echo 'installation ca-certificates completed...'
echo -e $TEXT_RESET

# Download the installation script: https://packages.gitlab.com/gitlab/gitlab-ce/install
curl -o /tmp/script.deb.sh https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo chmod +x /tmp/script.deb.sh
echo -e $TEXT_YELLOW
echo 'folder created and installation script downloaded...'
echo -e $TEXT_RESET

# run downloaded scrip
sudo /tmp/script.deb.sh
echo -e $TEXT_YELLOW
echo 'Running installation scrip for GitLab repositories completed...'
echo -e $TEXT_RESET

# install GitLab
sudo apt install gitlab-ce
echo -e $TEXT_YELLOW
echo 'Installation GitLab completed...'
echo -e $TEXT_RESET

# Adjust Firewall
sudo ufw allow http
sudo ufw allow https
ufw allow OpenSSH
echo -e $TEXT_YELLOW
echo 'Firewall added; SSSH, HTTP & HTTPS...'
echo -e $TEXT_RESET

# Start Firewall
sudo ufw enable
echo -e $TEXT_YELLOW
echo 'Start Firewall completed...'
echo -e $TEXT_RESET