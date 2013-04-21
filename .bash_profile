#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Starts X at login
[[ -z $DISPLAY && XDG_VTNR -le 2 ]] && exec startx
