CONFIGS_PREFIX="src"

# TODO: check if distribution/version is in approved list, abort if user wants
# TODO: create remote dev setup target

dependencies:
	sudo apt update -y && \
	sudo apt install -y \
		git vim screen vagrant virtualbox build-essential cmake python3-dev

packages: dependencies vim-packages
vim-packages: YouCompleteMe vim-surround

vimrc:
	cp ${CONFIGS_PREFIX}/.vimrc ~/

YouCompleteMe: vimrc #need vimrc for vundle plugin
	# installing vundle
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	# installing YCM
	cd ~/.vim/bundle/YouCompleteMe; python3 install.py --clangd-completer

vim-surround:
	mkdir -p ~/.vim/pack/tpope/start
	cd ~/.vim/pack/tpope/start
	git clone https://tpope.io/vim/surround.git
	vim -u NONE -c "helptags surround/doc" -c q

bashrc:
	cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc

all: packages bashrc
	@echo 'this build script has been tested on Ubuntu 19.04 using regolith.'
	@echo 'sudo add-apt-repository ppa:kgilmer/regolith-stable'
	@echo 'sudo apt update -y'
	@echo 'sudo apt install -y regolith-desktop'
help:
	@echo 'run `make all bashrc` in order to install the dev environment'
