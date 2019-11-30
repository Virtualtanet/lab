#!/bin/bash

# Package to mount NFS (example Unraid-01 share)
sudo apt install nfs-common

# showmount -e <NFS server name> (shows what you can mount)
# Command to mount OS folder to /nfs/home (need: mkdir /nfs/home)
sudo mount 10.82.11.19:/mnt/user/OS /nfs/home