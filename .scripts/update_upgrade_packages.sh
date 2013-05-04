#ª/bin/bash

if [ -f /etc/redhat-release ] ; then
    PKMGR="YUM"
    sudo yum update; sudo yum upgrade --assumeyes;
elif [ -f /etc/debian_version ] ; then
    PKMGR="APT-GET"
    sudo apt-get update; sudo apt-get upgrade -y;
elif [ -f /etc/arch-release ] ; then
    PKMGR="PACMAN"
    sudo pacman -Syu --noconfirm
fi

notify-send -u normal -a $PKMGR 'Upgrade complete'
