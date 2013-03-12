#!/bin/sh
case $1 in
    "dual" )
	xrandr --output LVDS1 --auto --output VGA1 --auto --primary;
	break;;
    "external" )
	xrandr --output LVDS1 --off --output VGA1 --auto --primary;
	break;;
    "right" )
	xrandr  --output LVDS1 --output VGA1 --auto --primary --left-of LVDS1;
	break;;
    "left" )
	xrandr  --output LVDS1 --output VGA1 --auto --primary --right-of LVDS1;
	break;;
    *)
	echo "Sets dual monitor configuration with Xrandr:
		sh configure_external_monitor [option]

		OPTIONS:
		dual,	Lets xrandr choose secondary screen 
			size and sets it as secondary screen.

		external, Disables laptop screen and configures
			automaticalli the external.

		right, 	same as dual but assuming your laptot is
			at the right of the external screen.

		left, 	same as dual but assuming your laptot is
			at the right of the external screen."
esac
