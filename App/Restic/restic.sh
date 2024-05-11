#!/bin/sh
. /mnt/SDCARD/App/Restic/common.sh
. /mnt/SDCARD/restic_config
PATH=/mnt/SDCARD/App/Restic/bin:$PATH restic --cacert /mnt/SDCARD/App/Restic/cacert.pem --cache-dir $RESTIC_CACHE_DIR "$@"
