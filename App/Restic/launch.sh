#!/bin/sh

sysdir=/mnt/SDCARD/.tmp_update

pressMenu2Kill st &

cd "$sysdir"
./bin/st -q -e "/mnt/SDCARD/App/Restic/restic-config.sh"

pkill -9 pressMenu2Kill