#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dot-files
############################

########## Variables

dir=~/dot-files                    # dotfiles directory
olddir=~/dot-files_old             # old dotfiles backup directory
files=".bash_aliases .git .i3 .vim .virmc .bashrc .gitconfig .vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
mkdir -p $olddir
echo "Created $olddir for backup of any existing dotfiles in ~"

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -f ~/$file ];
    then
	echo "[backup] $file"
    	mv ~/$file ~/dotfiles_old/
    else
	echo "[linked] $file"
    fi
    ln -s $dir/$file ~/$file
done
