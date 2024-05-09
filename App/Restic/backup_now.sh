#!/bin/sh
date > /mnt/SDCARD/.restic_last_backup_attempt
/mnt/SDCARD/App/Restic/restic.sh backup /mnt/SDCARD/Saves/ && date > /mnt/SDCARD/.restic_last_backup