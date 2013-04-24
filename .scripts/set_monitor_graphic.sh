#!/bin/bash

VGA=`xrandr | grep VGA | awk '{print $1}'`
LVDS=`xrandr | grep LVDS | awk '{print $1}'`
VGA_CON=`xrandr | grep VGA | awk '{print $2}'`
#!/bin/bash

VGA=`xrandr | grep VGA | awk '{print $1}'`
LVDS=`xrandr | grep LVDS | awk '{print $1}'`
VGA_CON=`xrandr | grep VGA | awk '{print $2}'`

gxmessage Elegir pantalla activa  -borderless -center -geometry 200x30 -title Openbox -default Ambas -buttons _Ambas:1,_Externa:2,_Integrada:3

case $? in

 3)	#! if [ $VGA_CON = "connected" ]; then
	xrandr --output $LVDS --same-as $VGA
	xrandr --output $LVDS --auto
	xrandr --output $VGA --off
	#! fi ;;

 2) 	if [ $VGA_CON = "connected" ]; then
	xrandr --output $VGA --auto
	xrandr --output $LVDS --same-as $VGA
	xrandr --output $LVDS --off
	else
	gxmessage Cable VGA desconectado, cacafuti
	fi ;;

 1) 	if [ $VGA_CON = "connected" ]; then
	xrandr --output $VGA --auto
	xrandr --output $LVDS --auto
	xrandr --output $LVDS --left-of $VGA
	else
	gxmessage Cable VGA desconectado, cacafuti
	fi ;;

	

esac
#!/bin/bash