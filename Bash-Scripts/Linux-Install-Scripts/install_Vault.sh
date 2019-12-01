#!/bin/bash

# Requirements:
# Go Language 1.12.7
# GIT
# amek

# Upgrade and apply latest patches
sudo apt-get update
sudo apt-get -y upgrade

# Install Go Language
wget https://storage.googleapis.com/golang/go1.12.7.linux-amd64.tar.gz

# Install Go Language in user/local for shared hosting
sudo tar -xvf go1.12.7.linux-amd64.tar.gz
sudo mv go /usr/local

# Clean up
rm -rf go1.12.7.linux-amd64.tar.gz

# Set 3 variables as GOROOT, GOPATH and PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# Add above lines to ~/.profile

# Add below lines to ~/.baschrc
export GOROOT=/usr/local/go
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export VAULT_ADDR=http://127.0.0.1:8200

# Install Git
sudo apt-get install git

# Install vault ~ Clone vault to your GOPATH
mkdir -p $GOPATH/src/github.com/hashicorp && cd $!
git clone https://github.com/hashicorp/vault.git
cd vault

# Install make
sudo apt install make

# Compile vault
make bootstrap
make dev

# Verify vault
vault -v