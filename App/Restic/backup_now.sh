#!/bin/sh
. /mnt/SDCARD/App/Restic/common.sh
date > $LAST_BACKUP_ATTEMPT_FILE
/mnt/SDCARD/App/Restic/restic.sh backup /mnt/SDCARD/Saves/ && date > $LAST_BACKUP_FILE