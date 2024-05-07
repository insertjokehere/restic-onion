#!/bin/sh

. /mnt/SDCARD/restic_config

date > /mnt/SDCARD/.restic_last_backup_attempt
/mnt/SDCARD/App/Restic/restic --cache-dir /mnt/SDCARD/.restic_cache backup /mnt/SDCARD/Saves/ && date > /mnt/SDCARD/.restic_last_backup