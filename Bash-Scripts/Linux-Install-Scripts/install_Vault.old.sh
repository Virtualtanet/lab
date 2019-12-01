#!/bin/bash

# Install HashiCorp Vault

# Update package repository
sudo apt-get update

# Install unzip
sudo apt-get install wget unzip

# Download Vault in this case version: vault_1.3.0
sudo wget https://releases.hashicorp.com/vault/1.3.0/vault_1.3.0_linux_amd64.zip

# Download checksum
sudo wget https://releases.hashicorp.com/vault/1.3.0/vault_1.3.0_SHA256SUMS

# Verify the integrity of the zip file
grep linux_amd64 vault_*_SHA256SUMS | sha256sum -c -

# Unzip Vault
sudo unzip vault_*.zip

# Move vault to system's path
sudo cp vault /usr/local/bin/

# set a Linux capability flag on the binary. 
# This adds extra security by letting the binary perform memory locking without, unnecessarily elevating its privileges.
sudo setcap cap_ipc_lock=+ep /usr/local/bin/vault

# Check Vault version
vault --version

#  Create a vault system user
sudo useradd -r -d /var/lib/vault -s /bin/nologin vault

# Set the ownership of /var/lib/vault to the vault user and the vault group exclusively.
sudo install -o vault -g vault -m 750 -d /var/lib/vault

# Create vault.hcl using nano or your favorite text editor.
sudo nano /etc/vault.hcl

# Copy into vault.hcl and replace example.com to your domain name
backend "file" {
        path = "/var/lib/vault"
}

listener "tcp" {
        tls_disable = 0
        tls_cert_file = "/etc/letsencrypt/live/vault.virtualtanet.com/fullchain.pem"
        tls_key_file = "/etc/letsencrypt/live/vault.virtualtanet.com/privkey.pem"

}

# Save and close the file, then secure the Vault configuration file’s permissions by only allowing the vault user to read it.
sudo chown vault:vault /etc/vault.hcl 
sudo chmod 640 /etc/vault.hcl 

# Next, to let Systemd manage the persistent Vault daemon, create a unit file at
sudo nano /etc/systemd/system/vault.service

# Copy into vault.service
[Unit]
Description=a tool for managing secrets
Documentation=https://vaultproject.io/docs/
After=network.target
ConditionFileNotEmpty=/etc/vault.hcl

[Service]
User=vault
Group=vault
ExecStart=/usr/local/bin/vault server -config=/etc/vault.hcl
ExecReload=/usr/local/bin/kill --signal HUP $MAINPID
CapabilityBoundingSet=CAP_SYSLOG CAP_IPC_LOCK
Capabilities=CAP_IPC_LOCK+ep
SecureBits=keep-caps
NoNewPrivileges=yes
KillSignal=SIGINT

[Install]
WantedBy=multi-user.target


