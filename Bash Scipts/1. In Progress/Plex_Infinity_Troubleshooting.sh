#!/bin/bash
# https://www.tecmint.com/clear-ram-memory-cache-buffer-and-swap-space-on-linux/
## Clear PageCache Only
# sync; echo 1 > /proc/sys/vm/drop_caches
## Clear dentries and inodes
# sync; echo 2 > /proc/sys/vm/drop_caches
## Clear PageCache, dentries and inodes
# sync; echo 3 > /proc/sys/vm/drop_caches 




# Create Con trab to clear cache

## Create bash file "clearcache.sh"
#!/bin/bash
# Note, we are using "echo 3", but it is not recommended in production instead use "echo 1"
echo "echo 3 > /proc/sys/vm/drop_caches"
##
chmod 755 clearcache.sh
crontab -e
0  2  *  *  *  /path/to/clearcache.sh


sync; echo 3 > /proc/sys/vm/drop_caches 