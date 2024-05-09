#!/bin/sh

Toggle_Auto_Backups ()
{
    if [ -f /mnt/SDCARD/.tmp_update/startup/restic_autostart.sh ]; then
        rm /mnt/SDCARD/.tmp_update/startup/restic_autostart.sh
    else
        cp /mnt/SDCARD/App/Restic/restic_autostart.sh /mnt/SDCARD/.tmp_update/startup/restic_autostart.sh
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
    if [ -f /mnt/SDCARD/.restic_last_backup ]; then
        cat /mnt/SDCARD/.restic_last_backup
    else
        echo "Never!"
    fi
}

Main_Menu ()
{
clear
if [ -f /mnt/SDCARD/.tmp_update/startup/restic_autostart.sh ]; then
    Option1="Disable automatic backups"
else
    Option1="Enable automatic backups"
fi
Option2="Init Restic Repository"
Option3="Backup Now"
Option4="Exit"

choice=$( echo -e "$Option1\n$Option2\n$Option3\n$Option4" | /mnt/SDCARD/.tmp_update/script/shellect.sh -t "              --== Restic ==--" -b "Last Backup: $(Last_Backup)")

[ "$choice" = "$Option1" ] && Toggle_Auto_Backups
[ "$choice" = "$Option2" ] && Init_Repo
[ "$choice" = "$Option3" ] && Backup_Now
[ "$choice" = "$Option4" ] && exit
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