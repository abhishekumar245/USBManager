#!/bin/bash

# USB Manager
# A small bash script for manage USB Drives on Linux terminal.
# Author - Abhishek Kumar

clear
echo "+---------------------------------+"
echo "|╦ ╦╔═╗╔╗    ╔╦╗╔═╗╔╗╔╔═╗╔═╗╔═╗╦═╗|"
echo "|║ ║╚═╗╠╩╗───║║║╠═╣║║║╠═╣║ ╦║╣ ╠╦╝|"
echo "|╚═╝╚═╝╚═╝   ╩ ╩╩ ╩╝╚╝╩ ╩╚═╝╚═╝╩╚═|"
echo "+---------------------------------+"
echo "|  USB Manager For Linux Terminal |"
echo "+---------------------------------+"
echo "|------UNMOUNT THE USB DRIVE------|"
echo "+---------------------------------+"
echo "|1. Exit from the folder where USB|"
echo "|Drive is mounted.                |"
echo "|2. Type the following command :  |"
echo "|sudo umount USB Drive Name       |"
echo "|e.g. sudo umount /dev/sda1       |"
echo "+---------------------------------+"
sudo fdisk -l /dev/sda | awk '/Device/ || /\/dev\/sda1/'
echo -n "Enter USB drive name(e.g. /dev/sda1): "
read -e usbname
echo -n "Enter folder name with its path for USB Drive: "
read -e usbfolder
mkdir $usbfolder
sudo mount $usbname $usbfolder
if [ $? -eq 0 ]; then
    echo "Mounted!"
else
    echo "Directory does not exist. Try Again!"
    exit 1
fi
