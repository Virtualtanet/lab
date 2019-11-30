#!/bin/bash
#!pdxevBwx%c9

# Official way to install latest version: get.docker.com
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#Add user to group to use docker as a non-root user
usermod -aG docker virtual

# Install Docker Compose github.com/docker/compose/release
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Docker Machine github.com/docker/compose/release
curl -L https://github.com/docker/machine/releases/download/v0.16.2/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
    chmod +x /tmp/docker-machine &&
    sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

#
#


W2K2019-TPL-CORE
W2K2019-TPL-GUI