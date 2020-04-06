CONFIGS_PREFIX="src"

# TODO: check if distribution/version is in approved list, abort if user wants

dependencies:
	sudo apt update -y && \
	sudo apt install -y \
		git vim screen vagrant virtualbox build-essential cmake python3-dev

packages: dependencies YouCompleteMe

YouCompleteMe:
	# installing vundle
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp ${CONFIGS_PREFIX}/.vimrc ~/
	vim +PluginInstall +qall
	# installing YCM
	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py --clangd-completer

all: packages
	@echo 'this build script has been tested on Ubuntu 19.04 using regolith.'
	@echo 'sudo add-apt-repository ppa:kgilmer/regolith-stable'
	@echo 'sudo apt update -y'
	@echo 'sudo apt install -y regolith-desktop'
bashrc:
	cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc
help:
	@echo 'run `make all bashrc` in order to install the dev environment'
