#!/bin/bash

# This function sets your configuration relinking and 
# making backups when necesary
backupFile()
{
    if [ -L $2 ]; then
	unlink $2
	echo -e "\033[34m [relink]\033[0m $2 "
    elif [ -e $2 ]; then
	if [ ! -d $3 ]; then
	    DIRNAME=`dirname "$3"`
	    mkdir -p $DIRNAME
	fi
	mv -f $2 $3 
	echo -e "\033[32m [backup]\033[0m $2 "
    else
	echo -e "\033[33m [linked]\033[0m $2"
    fi
    ln -s $1 $2
}

olddir=dotfiles_old
mkdir -p ${HOME}/$olddir
# restores home dotfiles
for file in .* ; do
    case $file in
	.|..|.git)
	    continue
	    ;;
	*)
	    backupFile `pwd`/$file ${HOME}/$file ${HOME}/$olddir/$file 
	    ;;
    esac
done

# loads aliases
source ${HOME}/.bash_aliases

# link .config/ files for openbox and tint2
backupFile `pwd`/tint2rc ${HOME}/.config/tint2/tint2rc ${HOME}/.config/tint2/tint2rc/$olddir/tint2rc
backupFile `pwd`/tint2rc ${HOME}/.config/tint2/tint2rc ${HOME}/.config/tint2/$olddir/tint2rc 
backupFile `pwd`/rc.xml ${HOME}/.config/openbox/rc.xml ${HOME}/.config/openbox/$olddir/rc.xml
backupFile `pwd`/autostart ${HOME}/.config/openbox/autostart ${HOME}/.config/openbox/$olddir/autostart

