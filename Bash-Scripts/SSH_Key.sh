#!/bin/bash

# Create SSH Key
ssh-keygen -t ed25519

# Create ~/.ssh/authorized_keys



# Copy ~/.ssh/id_ed25519.pub from your client to the ~/.ssh/authorized_keys file on your server.



# .ssh/authorized_keys file needs to contain the public key
# Then you can use the private key to login
#
# /etc/ssh/sshd_config add:
# - PermitRootLogin without-password
# - PermitRootLogin without-password
#