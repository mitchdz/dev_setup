#!/bin/bash

##---------dependency list---------##
	# xrandr tested with v1.5
	# grep tested with v3.3
##---------------------------------##

##---------pass in brightness value---------##
	#can pass in argument such as:
	# brightness 60
	#to set the brightness to 60%.
##------------------------------------------##

##-------------Symbolic Link-------------##
	#sudo ln -s /<path>/<to>/brightness.sh /usr/local/bin/brightness
##---------------------------------------##

if [ -z "$1" ]	#check if first input parameter is null
then

printf "What brightness level do you want the monitors to become? Enter an percentage: "
read BRIGHTNESS

else
BRIGHTNESS=$1	#brightness becomes value of input
fi

#echo "		You selected a brightness of $BRIGHTNESS%"
str=$(xrandr --query | grep " connected " | grep -Eo '^[^ ]+')
for word in $str; do
		xrandr --output $word --brightness $(bc<<<"$BRIGHTNESS * .01")
done
