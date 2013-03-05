#!/bin/bash
olddir=dotfiles_old
mkdir -p ${HOME}/$olddir
files=".bash_aliases .i3 .vim .virmc .bashrc .gitconfig .vimrc"   
for file in .* ; do
    case $file in
	.|..|.git)
	    continue
	    ;;
	*)
	    if [ -L ${HOME}/$file ]; then
		unlink ${HOME}/$file
		echo -e "\033[34m [relink]\033[0m $file \e[0m"
	    elif [ -e ${HOME}/$file ]; then
		mv -f ${HOME}/$file ${HOME}/$olddir/$file
		echo -e "\033[32m [backup]\033[0m $file \e[0m"
	    else
		echo -e "\033[33m [linked]\033[0m $file"
	    fi
	    ln -s `pwd`/$file ${HOME}
	    ;;
    esac
done
source ${HOME}/.bash_aliases
