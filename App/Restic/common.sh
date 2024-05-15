#!/bin/sh
VERSION="0.1.0"
STARTUP_SCRIPT=/mnt/SDCARD/.tmp_update/startup/restic_autostart.sh
DATA_DIR=/mnt/SDCARD/.restic
LAST_BACKUP_FILE="${DATA_DIR}/restic_last_backup"
LAST_BACKUP_ATTEMPT_FILE="${DATA_DIR}/restic_last_backup_attempt"
RESTIC_CACHE_DIR="${DATA_DIR}/cache"