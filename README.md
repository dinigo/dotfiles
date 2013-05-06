DOTFILES
========
Here you've got my motfiles. Use them as you wish and tell me if you think some feature is cool o how would you improve it. Feel free to make any pull request.

## WHAT'S INSIDE
It conains a bunch of config files and scripts you can use. A script for easy install makes it easy to use when changing your PC.

### Config files for programs
It contains config files for the following:
* bash
* xterm
* X server init files
* git
* dmenu
* dunst
* i3wm: i3bar, i3lock and i3 general congif
* vim
* tint2
* openbox

### Scripts
It also contains several scripts, some at the __.bash_aliases__ and some at the _.scripts/_ folder
* set_brightness.sh: Reads the current brightness value and writes a new one depending on the parametters.
* set_monitor.sh:    Sets the monitor layout with xrandr. It has an `auto` option but doesn't work pretty well.
* set_proxy.sh:      Sets enviromen variables for the college proxy.
* dmenu_run:         Calls dmenu with the config file.
* colour_test.sh:    Shows your terminal emulator color scheme.
* updatemirrors.sh:  Gets your mirror list from arch and updates it at your pacman.d/ folder.

### Requirements
In order to work you just have to be running some linux distro. Any of the above programs already know where to get this config files, but y basically run one of those two combox
* i3 + dmenu + dunst ---> [current]
* openbox + tint2

### Install process
Just run the install script!
> $ ./install.sh
