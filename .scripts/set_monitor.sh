#!/bin/sh

INTERNAL="LVDS1"
EXTERNAL="VGA1"

case $1 in


    "single" )
	xrandr --output $INTERNAL --auto --primary --output $EXTERNAL --off
	continue;;
    "dual" )
	xrandr --output $INTERNAL --auto --output $EXTERNAL --auto --primary;
	continue;;
    "external" )
	xrandr --output $INTERNAL --off --output $EXTERNAL --auto --primary;
	continue;;
    "right" )
	xrandr  --output $INTERNAL --output $EXTERNAL --auto --primary --left-of $INTERNAL;
	continue;;
    "left" )
	xrandr  --output $INTERNAL --auto --output $EXTERNAL --auto --primary --right-of $INTERNAL;
	continue;;
    *)
	echo "Sets dual monitor configuration with Xrandr:
	sh configure_external_monitor [option]

	OPTIONS:

	single,	Disables second monitor config so that
	the laptop screen is the only screen.

	dual,	Lets xrandr choose secondary screen 
	size and sets it as secondary screen.

	external, Disables laptop screen and configures
	automaticalli the external.

	right, 	same as dual but assuming your laptot is
	at the right of the external screen.

	left, 	same as dual but assuming your laptot is
	at the right of the external screen."
esac

if hash nitrogen 2>/dev/null; then
    nitrogen --restore
fi
