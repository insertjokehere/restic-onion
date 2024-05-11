#!/bin/sh

. /mnt/SDCARD/App/Restic/common.sh

Toggle_Auto_Backups ()
{
    if [ -f $STARTUP_SCRIPT ]; then
        rm $STARTUP_SCRIPT
    else
        cp /mnt/SDCARD/App/Restic/restic_autostart.sh $STARTUP_SCRIPT
    fi
    Main_Menu
}

Backup_Now ()
{
    /mnt/SDCARD/App/Restic/backup_now.sh
    read -n 1 -s -r -p "Press A to continue"
    Main_Menu
}

Init_Repo ()
{
    /mnt/SDCARD/App/Restic/init_repo.sh
    read -n 1 -s -r -p "Press A to continue"
    Main_Menu
}

Last_Backup ()
{
    if [ -f $LAST_BACKUP_FILE ]; then
        cat $LAST_BACKUP_FILE
    else
        echo "Never!"
    fi
}

About_Menu ()
{
    echo "restic-onionui"
    echo "v${VERSION}"
    echo "Copyright (c) 2024, Will Hughes"
    echo
    echo "Restic - Copyright (c) 2014, Alexander Neumann"
    echo "Rclone - Copyright (C) 2012, Nick Craig-Wood"
    echo "For more details, see LICENSE file"
    echo
    read -n 1 -s -r -p "Press A to continue"
    Main_Menu
}

Main_Menu ()
{
    mkdir -p $DATA_DIR || true
    clear
    if [ -f $STARTUP_SCRIPT ]; then
        Option1="Disable automatic backups"
    else
        Option1="Enable automatic backups"
    fi
    Option2="Init Restic Repository"
    Option3="Backup Now"
    Option4="About"
    Option5="Exit"

    choice=$( echo -e "$Option1\n$Option2\n$Option3\n$Option4\n$Option5" | /mnt/SDCARD/.tmp_update/script/shellect.sh -t "              --== Restic ==--" -b "Last Backup: $(Last_Backup)")

    [ "$choice" = "$Option1" ] && Toggle_Auto_Backups
    [ "$choice" = "$Option2" ] && Init_Repo
    [ "$choice" = "$Option3" ] && Backup_Now
    [ "$choice" = "$Option4" ] && About_Menu
    [ "$choice" = "$Option5" ] && exit
}

Missing_Config ()
{
    echo '
No Restic config file found!

Create a script called restic_config in the root of
your SD card that exports (at least) 
RESTIC_REPOSITORY and RESTIC_PASSWORD
    '
    read -n 1 -s -r -p "Press A to continue"
    exit
}

if [ -f /mnt/SDCARD/restic_config ]; then
    Main_Menu
else
    Missing_Config
fi