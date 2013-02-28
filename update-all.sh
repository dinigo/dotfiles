#!/bin/bash
echo 'Actualizando repositorios APT'
apt-get update -qq
echo 'Instalando actualizaciones APT'
apt-get upgrade -qqy
echo 'Actualizando plugins de VIM'
cd ~/.vim/bundle/javacomplete
git pull
cd ~/.vim/bundle/nerdcommenter
git pull
cd ~/.vim/bundle/snipmate
git pull
cd ~/.vim/bundle/syntastic
git pull
cd ~/.vim/bundle/tagbar
git pull
