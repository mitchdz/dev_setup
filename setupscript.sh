CONFIG_PATH=~/.config/i3/

## TODO: make it so you don't need to press "y" to install.

#-------------------i3-gaps Dependencies----------------#
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install sudo apt-get install libxcb-xrm-dev

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev
#--------------------------------------------------------#
#-----------------Personal Dependencies------------------#
sudo apt-get install scrot		#commandline tool to take images
sudo apt-get install ImageMagick	#commandline tool to edit images
sudo apt-get install compton		#X11 compositor
sudo apt-get install i3blocks		#i3 program for the bar.
sudo apt-get install feh		#program to view files for my i3lock
sudo apt-get install rofi		#program to select files
sudo apt-get install i3lock		#i3 lock screen.
sudo apt-get install i3status		#i3 program to run in i3block
sudo apt-get install thunar		#file manager I use.
#-----------------Installing and making i3---------------#
mkdir ~/development/
cd ~/development/

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

#--------------------Moving files from git-----------------#
cd ~/git/desktop_i3_setup/

=======
#

--------------------Moving files from git-----------------#
cd ~/git/desktop_i3_setup/


## TODO: reboot and then move config files.

cp i3blocks.conf 	$CONFIG_PATH
cp background.jpg 	$CONFIG_PATH
cp config 		$CONFIG_PATH
cp i3lock-transparent	$CONFIG_PATH
cp circlelock.png       /home/$USER/Pictures/circlelock.png
