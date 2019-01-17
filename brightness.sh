#!/bin/bash
#this program is made to run on Ubuntu 16.04, and requires no additional packages.
##-------------Symbolic Link-------------##
	#to be able to call the command brightness anyhwere use the command
	#sudo ln -s /path/to/brightness.sh /usr/local/bin/brightness
	#where /path/to/brightness.sh is where brightness.sh is, then you will be able to call
	#"brightness" anywhere in the terminal.
##---------------------------------------##

##---------pass in brightness value---------##
	#can pass in argument such as:
	# brightness 60
	#to set the brightness to 60%.
##------------------------------------------##

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
