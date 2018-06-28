#!/bin/bash
clear

	#un-comment this if I want to disable root.
#if [ "$EUID" -e 0]
#	then echo "Please do not run this as root."
#	echo "please login with your regular user."
#	exit
#fi

#to save output of a file do ./setupscript.sh | tee outputtest/trial#


#----------------Color Codes for Bash (:------------------#
#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
#----------------------------------------------------------#
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
BOLD="\e[1m"
NB="\e[21m" #No Bold

echo -e "Hello! welcome to my install script. This script is intended to be used on Ubuntu 16.04/17.04/18.04 as of April 28th."
echo -e "This program should work without running it as sudo."
echo -e " ** \t ${RED}This script ${BOLD}will${NB} install PPA's without prompts${NC}"
echo -e " ** \t ${RED}Please read the script in its entirety before running it${NC}"

if [ -f /etc/os-release ]; then	#attempt to determine what the system is running.

        . /etc/os-release # change directory
        OS=$NAME	  # find OS 
        VER=$VERSION_ID	  # find OS version
	
	if [ -z "$OS" ] || [ -z "$OS" ]; then	#checks if string is zero length.
		echo -e "I could not detect what your system is. Defaulting to ${BOLD}Ubuntu 16.04${NC}"
		OS="Ubuntu"
		VER="16.04"
	else
		echo -e "I detect your system is ${BOLD}$OS $VER${NB}"
	fi

else
	echo -e "I could not detect what your system is. Defaulting to ${BOLD}Ubuntu 16.04${NC}"
	OS="Ubuntu"
	VER="16.04"
fi


echo -e "${GREEN}Press space to continue or CTRL+C to exit..${NC}"	#prompt the user.
read -n1 -r -p "" key		#get input from user
if [ "$key" = '' ]; then	#proceed is space is pressed.

if [ "$OS" == "Ubuntu" ]; then
	PACKAGEMAN="apt-get install"
fi

	#who am i did not work on base ubuntu build.
LOGINUSER=$(whoami | awk '{print $1}')	#this is incase someone runs as root.
CONFIG_PATH=/home/$LOGINUSER/.config/i3/

#-------------------i3-gaps Dependencies----------------#
if [ "$OS" == "Ubuntu" ]; then #dependencies for Ubuntu.
		#dependencies for Ubuntu 16.04
        if [ "$VER" == "16.04" ]; then	
sudo add-apt-repository ppa:aguignard/ppa -y
sudo add-apt-repository ppa:dawidd0811/neofetch -y
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -y
		#dependencies for Ubuntu 18.04/17.04
        elif [ "$VER" == "18.04" ] || [ "$VER" == "17.04"]; then	
sudo apt-get install neofetch -y
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake -y
        fi
sudo apt-get update
fi

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
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##method to take out env zsh inside of install script.
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh
sed -i.tmp 's:env zsh::g' install.sh
sed -i.tmp 's:chsh -s .*$::g' install.sh
sh install.sh


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

sed -i "/.*export ZSH=.*/c   export ZSH=/home/$LOGINUSER/.oh-my-zsh" /home/$LOGINUSER/.zshrc
	#this is the testing I am doing with inserting a tab inside of sed.
#sed -i "/.*export ZSH=.*/c   export ZSH=/home/$USER/.oh-my-zsh" /home/$USER/.zshrc
#chsh -s /bin/zsh
mkdir /home/$LOGINUSER/.config/terminator/
sudo ln -s /home/$LOGINUSER/git/desktop_i3_setup/terminator/config /home/$LOGINUSER/.config/terminator/config
#----------------------------------------------------------#

#reboot

else
	echo "that isn't space or Ctrl+C silly!"
fi
