#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dot-files
############################

########## Variables
dir=`pwd`	                    # dotfiles directory
olddir=dotfiles_old             # old dotfiles backup directory
files=".bash_aliases .i3 .vim .virmc .bashrc .gitconfig .vimrc"    # list of files/folders to symlink in homedir
# create dotfiles_old in homedir
mkdir -p ~/$olddir
# change to the dotfiles directory
cd $dir
# if file is a link it unlinks
# if is a file it backs up
# then it links to my dotfile
for file in $files; do
    if [ -L ~/$file ];
    then
	unlink ~/$file
	echo "[relink] $file"
    else
	if [ -f ~/$file ];
	then
	    echo "[backup] $file"
	    mv ~/$file ~/$olddir/$file
	else
	    echo "[linked] $file"
	fi
    fi
    ln -s $dir/$file ~/$file
done
