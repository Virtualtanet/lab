#!/bin/bash

# Installing the Dependencies
sudo apt update
sudo apt install ca-certificates curl openssh-server postfix

# Installing GitLab
cd /tmp
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash /tmp/script.deb.sh
sudo apt install gitlab-ce

# Configure UFW
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
sudo ufw status

# Editing the GitLab Configuration File
sudo nano /etc/gitlab/gitlab.rb 

#! edit line: external_url http to https and fill your domain https://gitlab.virtualtanet.com
#! Uncomment letsencrypt['contact_emails'] = ['sammy@example.com']

# Reconfigure gitlab
sudo gitlab-ctl reconfigure

# Log to gitlab
