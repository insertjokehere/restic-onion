# Restic-Onion

This app backs up your Onion saves using [Restic](https://restic.net/).

## Features

* Backup saves to any target restic supports (including through rclone)
* Automatically backup when OnionOS starts

## Installation

* Download the zip from the [releases page](https://github.com/insertjokehere/restic-onion/releases)
* Extract the zip into the root of your SD card
  * You should now have an `App/Restic` folder on your SD card
* Create a `restic_config` file in the root of the SD card
  * This file is a shell script, and should `export` at least `RESTIC_REPOSITORY` and `RESTIC_PASSWORD`
  * See `restic_config.example` for examples
* Launch the Restic app, init the repository if you need to, run a backup and enable automatic backups if you want