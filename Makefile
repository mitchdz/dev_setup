CONFIGS_PREFIX="src"

all:
# this build script has been tested on Ubuntu 19.04 using regolith.
# sudo add-apt-repository ppa:kgilmer/regolith-stable
# sudo apt update -y
# sudo apt install -y regolith-desktop

sudo apt update -y && \
sudo apt install -y \
        git vim screen vagrant virtualbox build-essential cmake python3-dev

#installing vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp .src/.vimrc ~/
vim +PluginInstall +qall

#install YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer


echo"If you have not yet, add the bashrc commands to the end of your ~/.bashrc."
echo"Enter the following command:"
echo"    cat src/bashrc_ending.txt >> ~/.bashrc"


help:
	@echo 'run `make all` in order to install the dev environment'
