#!/bin/bash
#this program is made to run on Ubuntu 16.04, and requires no additional packages.
##-------------Symbolic Link-------------##
	#to be able to call the command brightness anyhwere use the command
	#sudo ln -s /path/to/brightness.sh /usr/local/bin/brightness
	#where /path/to/brightness.sh is where brightness.sh is, then you will be able to call
	#"brightness" anywhere in the terminal.
##---------------------------------------##

##---------Pipe brightness value---------##
	#If you wish to put the brightness into the command as you call it, use |
	#ex: to set the monitors to a brightness of 42% you would invoke
	#echo 42 | brightness
##---------------------------------------##
printf "What brightness level do you want the monitors to become? Enter an percentage: "
read BRIGHTNESS
echo "         --------------------You selected a brightness of $BRIGHTNESS%--------------------"
str=$(xrandr --query | grep " connected " | grep -Eo '^[^ ]+')
for word in $str; do
		xrandr --output $word --brightness $(bc<<<"$BRIGHTNESS * .01")
done
