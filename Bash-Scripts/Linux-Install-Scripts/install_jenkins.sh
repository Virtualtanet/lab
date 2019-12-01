#!/bin/bash

# Requirements:
# OpenJDK JRE - 64 bits

# Install OpenJDK JRE 64 bits
sudo apt install openjdk-11-jre

# Check Java Version
sudo java -version

# Update & Upgtade
sudo apt-get Update
sudo apt-get Upgrade

# Install Jenkins (Documentation can be found on jenkins.io)
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo apt-add-repository "deb https://pkg.jenkins.io/debian-stable binary/"
sudo apt-get update
sudo apt-get install jenkins

# Check Jenkins status, start, restart etc.
sudo systemctl status jenkins

# Navigate to ipv4:8080

# Unlock Jenkins /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

