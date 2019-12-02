#!/bin/bash

# Install unzip
sudo apt-get install wget unzip

# Download terraform in this case version: terraform_0.12.16
# wget https://releases.hashicorp.com/terraform/${VER}/terraform_${VER}_linux_amd64.zip

sudo wget https://releases.hashicorp.com/terraform/0.12.16/terraform_0.12.16_linux_amd64.zip

# Wnzip terraform_${VER}_linux_amd64.zip
sudo unzip terraform_0.12.16_linux_amd64.zip

# Move terraform to systempath to call terraform from any directory
sudo mv terraform /usr/local/bin/

# Clean zip file
sudo rm -rf terraform_0.12.16_linux_amd64.zip

# Check terraform version
terraform -v

# Verify terrform
terraform