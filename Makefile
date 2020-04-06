CONFIGS_PREFIX="src"

depencies:
	sudo apt update -y && \
	sudo apt install -y \
		git vim screen vagrant virtualbox build-essential cmake python3-dev

packages: dependencies YouCompleteMe

YouCompleteMe:
	# installing vundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp .${CONFIGS_PREFIX}/.vimrc ~/
	vim +PluginInstall +qall
	# installing YCM
	cd ~/.vim/bundle/YouCompleteMe
	python3 install.py --clangd-completer

all: dependencies
	@echo 'this build script has been tested on Ubuntu 19.04 using regolith.'
	@echo 'sudo add-apt-repository ppa:kgilmer/regolith-stable'
	@echo 'sudo apt update -y'
	@echo 'sudo apt install -y regolith-desktop'
	@echo 'If you have not yet, add the bashrc commands to the end of your ~/.bashrc.'
	@echo 'Enter the following command:'
	@echo '    cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc'

help:
	@echo 'run `make all` in order to install the dev environment'
