#!/bin/bash

#if [ "$EUID" -e 0]
#	then echo "Please do not run this as root."
#	echo "please login with your regular user."
#	exit
#fi

#to save output of a file do ./setupscript.sh | tee outputtest/trial#


	#who am i did not work on base ubuntu build.
LOGINUSER=$(whoami | awk '{print $1}')	#this is incase someone runs as root.
CONFIG_PATH=/home/$LOGINUSER/.config/i3/

#-------------------i3-gaps Dependencies----------------#
sudo add-apt-repository ppa:aguignard/ppa -y
sudo add-apt-repository ppa:dawidd0811/neofetch -y
sudo apt-get update
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -y
#--------------------------------------------------------#
#-----------------Personal Dependencies------------------#
sudo apt-get install scrot -y		#commandline tool to take images
sudo apt-get install imagemagick -y	#commandline tool to edit images
sudo apt-get install compton -y		#X11 compositor
sudo apt-get install i3blocks -y	#i3 program for the bar.
sudo apt-get install feh -y		#program to view files for my i3lock
sudo apt-get install rofi -y		#program to select files
sudo apt-get install i3lock -y		#i3 lock screen.
sudo apt-get install i3status -y	#i3 program to run in i3block
sudo apt-get install thunar -y		#file manager I use.
sudo apt-get install terminator -y	#terminal of choice.
sudo apt-get install curl -y		#terminal program to transfer a URL.
sudo apt-get install vim -y		#yes.
sudo apt-get install neofetch -y	#cool system output for terminal.
#-----------------Installing and making i3---------------#
mkdir /home/$LOGINUSER/development/
cd /home/$LOGINUSER/development/

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
#----------------------------------------------------------#
#-------------------adding zsh-----------------------------#
sudo apt install zsh -y
##TODO:pass exit command into the new zsh login screen.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#adding powerline fonts
cd /home/$LOGINUSER/git/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
#----------------------------------------------------------#
#--------------------Moving files from git-----------------#
cd /home/$LOGINUSER/git/desktop_i3_setup/

##TODO:fix how $user gives root when running as sudo.

mkdir $CONFIG_PATH
cp i3blocks.conf 	$CONFIG_PATH
cp background.jpg 	$CONFIG_PATH
cp config 		$CONFIG_PATH
cp i3lock-transparent	$CONFIG_PATH
cp circlelock.png       /home/$LOGINUSER/Pictures/circlelock.png
cp zshrc		/home/$LOGINUSER/.zshrc
#----------------------------------------------------------#
#-------------------adding zsh-----------------------------#



#TODO:add reboot once I'm done with the script.
#reboot
