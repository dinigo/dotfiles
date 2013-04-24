#!/bin/sh

INTERNAL=`xrandr | grep LVDS | awk '{print $1}'`
EXTERNAL=`xrandr | grep VGA | awk '{print $1}'`
EXTERNAL_IS_CON=`xrandr | grep VGA | awk '{print $2}'`
OUTPUTS=` xrandr | grep " connected" | awk '{print $1}'`

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
    "auto" )
	for output in $OUTPUTS; do
            xrandr --output $output --auto
        done
	
#       if [ $EXTERNAL_IS_CON = "connected" ]; then
#           xrandr  --output $INTERNAL --auto --output $EXTERNAL --auto --primary --right-of $INTERNAL;
#       else
#           xrandr --output $INTERNAL --auto --primary --output $EXTERNAL --off
#       fi
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
