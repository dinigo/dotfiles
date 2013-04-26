# Starts dropbox daemon
dropboxd &

# Unifies resources for the terminal
xrdb  ~/.Xresources

# Set background color
xsetroot -solid "#333333"

# Notification
dunst -config ~/.i3/dunstrc &

# Runs i3wm
exec i3

