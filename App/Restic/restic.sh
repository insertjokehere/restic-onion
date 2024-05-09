#!/bin/sh
. /mnt/SDCARD/restic_config
PATH=/mnt/SDCARD/App/Restic/bin:$PATH restic --cacert /mnt/SDCARD/App/Restic/cacert.pem --cache-dir /mnt/SDCARD/.restic_cache "$@"
