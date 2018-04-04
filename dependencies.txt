
#-------------------i3-gaps-Dependencies----------------#
sudo add-apt-repository ppa:aguignard/ppa
sudo apt-get update
sudo apt-get install sudo apt-get install libxcb-xrm-dev

sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm-dev
#--------------------------------------------------------#
#-----------------Installing and making i3---------------#
mkdir ~/development/
cd ~/development/
git clone https://www.github.com/Airblader/i3 i3-gaps
sudo apt-get install autoconf
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

sudo apt-get install i3status

#--------------------Moving files from git-----------------#
cd ~/git/desktop_i3_setup/

CONFIG_PATH=~/.config/i3/

cp i3blocks.conf 	CONFIG_PATH
cp background.jpg 	CONFIG_PATH
cp config 		CONFIG_PATH
cp i3lock-transparent	CONFIG_PATH


