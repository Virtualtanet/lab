#!/bin/bash

# .ssh/authorized_keys file needs to contain the public key
# Then you can use the private key to login
#
# /etc/ssh/sshd_config add:
# - PermitRootLogin without-password
# - PermitRootLogin without-password
#