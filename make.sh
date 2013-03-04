#!/bin/bash
olddir=${HOME}/dotfiles_old             # old dotfiles backup directory
mkdir -p $olddir
files=".bash_aliases .i3 .vim .virmc .bashrc .gitconfig .vimrc"   
for file in $files; do
    if [ -L ~/$file ];
    then
	unlink ~/$file
	echo -e "\033[34m [relink]\033[0m $file \e[0m"
    else
	if [ -f ~/$file ];
	    then
	    	mv -f ~/$file ~/$olddir/$file
	    	echo -e "\033[32m [backup]\033[0m $file \e[0m"
	    else
	  	echo -e "\033[33m [linked]\033[0m $file"
	fi
    fi
    ln -s $file ${HOME}/$file
done
