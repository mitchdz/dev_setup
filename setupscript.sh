CONFIG_PATH=~/.config/i3/
#-------------------i3-gaps Dependencies----------------#
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev -y
#--------------------------------------------------------#
#-----------------Personal Dependencies------------------#
sudo apt-get install scrot ImageMagick compton i3blocks feh rofi i3lock i3status thunar terminator curl -y
# scrot		#commandline tool to take images
# ImageMagick	#commandline tool to edit images
# compton	#X11 compositor
# i3blocks	#i3 program for the bar.
# feh		#program to view files for my i3lock
# rofi		#program to select files
# i3lock	#i3 lock screen.
# i3status	#i3 program to run in i3block
# thunar	#file manager I use.
# terminator	#terminal of choice.
# curl		#terminal program to transfer a URL.
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
