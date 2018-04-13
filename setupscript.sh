CONFIG_PATH=~/.config/i3/
#-------------------i3-gaps Dependencies----------------#
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -y
#--------------------------------------------------------#
#-----------------Personal Dependencies------------------#
#sudo apt-get install scrot imagemagick compton i3blocks feh rofi i3lock i3status thunar terminator curl -y
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
#----------------------------------------------------------#
#--------------------Moving files from git-----------------#
cd ~/git/desktop_i3_setup/

##TODO:fix how $user gives root when running as sudo.

mkdir $CONFIG_PATH
<<<<<<< HEAD
=======

>>>>>>> 517c4953f05baa087c2ea615191439a1cd364af3
cp i3blocks.conf 	$CONFIG_PATH
cp background.jpg 	$CONFIG_PATH
cp config 		$CONFIG_PATH
cp i3lock-transparent	$CONFIG_PATH
cp circlelock.png       /home/$USER/Pictures/circlelock.png

#-------------------adding zsh-----------------------------#
sudo apt install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#--adding powerline fonts--#
cd ~/git/
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
#--done adding those fonts--#
#----------------------------------------------------------#



#TODO:add reboot once I'm done with the script.
#reboot
