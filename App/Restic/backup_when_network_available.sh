#!/bin/sh
for run in $(seq 10); do
    echo $run
    if [ "$(ip addr show wlan0 | grep inet)" != "" ]; then
        /mnt/SDCARD/App/Restic/backup_now.sh
        exit
    fi
    sleep 30
done