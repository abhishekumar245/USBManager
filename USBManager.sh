#!/bin/bash

# USB Manager
# A small bash script to manage USB Drives on Linux terminal.
# Author - Abhishek Kumar

green='\033[0;32m'
red='\033[0;31m'
reset='\033[0m'

logo() {
  echo -e "${green}
                              @@@@@
                        @@@@@@@@@@@@
                      @@@@@@@@@@@@@@
                     @@@      @@@@@
                    @@:
                   @@+                                       ╦ ╦╔═╗╔╗   ╔╦╗╔═╗╔╗╔╔═╗╔═╗╔═╗╦═╗
    @@@@=         @@*                                        ║ ║╚═╗╠╩╗  ║║║╠═╣║║║╠═╣║ ╦║╣ ╠╦╝
  +@@@@@@=       @@#                                         ╚═╝╚═╝╚═╝  ╩ ╩╩ ╩╝╚╝╩ ╩╚═╝╚═╝╩╚═
  @@@@@@@@      @@*                           @@              USB Manager For Linux Terminal
 #@@@@@@@@%====@@@============================@@@%            +-----------------------------+
 #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#          |----Author:Abhishek Kumar----|
 #@@@@@@@@%===========@@@=====================@@@%            +-----------------------------+
  @@@@@@@@             @@*                    @@              |----UNMOUNT THE USB DRIVE----|
  +@@@@@@=              @@-                                   |1. Exit from the folder where|
    @@@@=                @@:                                  |USB Drive is mounted.        |
                          @@-                                 +-----------------------------+
                           @@-                                |2. Type the following command|
                            @@+     @@@@@@                    |sudo umount USB Drive Name   |
                             @@@@@@@@@@@@@                    |e.g. sudo umount /dev/sda1   |
                               @@@@@@@@@@@                    +-----------------------------+
                                    @@@@@@
${reset}"
}

clear
logo

if sudo fdisk -l /dev/sda > /dev/null 2>&1; then
    echo -e "[${green}*${reset}] USB Drive(s) Connected!"
    echo -e "[${green}*${reset}] Details of USB Drive(s) : "
    sudo fdisk -l | awk '/^Device/ {next} /\/dev\/sd[a-z][0-9]/'
else
    echo -e "[${red}*${reset}] USB Drive(s) Not Found!"
    exit 1
fi

read -p $'[\033[0;32m*\033[0m] Enter USB drive name (e.g. /dev/sda1): ' usbname
read -p $'[\033[0;32m*\033[0m] Enter folder name with its path for USB Drive: ' usbfolder

if mkdir -p "$usbfolder"; then
    echo -e "[${green}*${reset}] Directory created!"
else
    echo -e "[${red}*${reset}] Failed to create directory. Try Again!"
    exit 1
fi

if sudo mount "$usbname" "$usbfolder"; then
    echo -e "[${green}*${reset}] Mounted!"
else
    echo -e "[${red}*${reset}] Failed to mount the USB drive. Check if the USB drive name and folder path are correct!"
    exit 1
fi
