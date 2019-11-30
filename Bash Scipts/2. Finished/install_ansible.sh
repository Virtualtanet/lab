#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

# Ensure software-properties-common package is installed
sudo apt install software-properties-common
echo -e $TEXT_YELLOW
echo 'software-properties-common inished...'
echo -e $TEXT_RESET

# Then add the Ansible PPA by typing the following command
sudo apt-add-repository ppa:ansible/ansible
echo -e $TEXT_YELLOW
echo 'repository pp:ansible/ansible added...'
echo -e $TEXT_RESET

# refresh your system's package index
sudo apt update
echo -e $TEXT_YELLOW
echo 'refesh apt completed...'
echo -e $TEXT_RESET

# Install ansible/ansible
sudo apt install ansible
echo -e $TEXT_YELLOW
echo 'ansible installation completed...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'Reboot required!'
    echo -e $TEXT_RESET
fi
