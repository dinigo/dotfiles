# Starts dropbox daemon
dropboxd &

# Unifies resources for the terminal
xrdb  ~/.Xresources

# Notification
dunst -config ~/.i3/dunstrc &

# Runs i3wm
exec i3

