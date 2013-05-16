# Starts dropbox daemon
dropboxd &

# Unifies resources for the terminal
xrdb  ~/.Xresources

# Set background color
xsetroot -solid "#333333"

# Notification
dunst -config ~/.i3/dunstrc &

# Automount daemon
udiskie &

# Starts gmail notifications
[ -e ~/.config/gmailnotify.conf ] && gmailnotify.py &

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.mpd/mpd.pid ] && mpd

# Runs i3wm
exec i3
