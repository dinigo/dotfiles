#!/bin/bash

# Create folders and download pathogen
echo -e "Installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Clone plugins
cd ~/.vim/bundle
# NerdCommenter: generates and toggles comments
echo -e "Installing NerdCommenter"
git clone --quiet https://github.com/scrooloose/nerdcommenter.git
# Snipmate: simulates textmate snipets
echo -e "Installing Snipmate"
git clone --quiet https://github.com/garbas/vim-snipmate.git
git clone --quiet https://github.com/tomtom/tlib_vim.git
git clone --quiet https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone --quiet https://github.com/honza/snipmate-snippets.git
# Syntastic: syntax error check
echo -e "Installing Syntastic"
git clone --quiet https://github.com/scrooloose/syntastic.git
# Supertab: for completion
echo -e "Installing Supertab"
git clone --quiet https://github.com/ervandew/supertab.git

# Run :Helptags to generate help documents from plugins
echo -e "Configuring"
vim -c "Helptags" \
    -c "qa!"
