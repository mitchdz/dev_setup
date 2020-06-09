# I like to use regolith with my Ubuntu environment.
# sudo add-apt-repository ppa:kgilmer/regolith-stable
# sudo apt update -y
# sudo apt install -y regolith-desktop

CONFIGS_PREFIX="src"
STAGING="build"

mkfile_path := $(abspath $(lastword $)MAKEFILE_LIST)))

# TODO: check if distribution/version is in approved list, abort if user wants
# TODO: create remote dev setup target
#
all-packages: dependencies vim-development terminator-setup bashrc

create_dirs:
	-mkdir -p ${STAGING}

dependencies:
	sudo apt update -y && \
	sudo apt install -y \
		vim build-essential cmake python3-dev terminator

vim-development: Vundle

Vundle: YouCompleteMe vim-surround
	vim +PluginInstall +qall

terminator-setup:
	# add fonts
	-mkdir -p ~/.fonts/
	-git clone https://github.com/powerline/fonts ${STAGING}
	-cp ${STAGING}/fonts/UbuntuMono ~/.fonts/
	# copy personal terminator config
	-mkdir -p ${HOME}/.config/terminator
	-cp ./${CONFIGS_PREFIX}/terminator/config ${HOME}/.config/terminator/config

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
	-git clone https://tpope.io/vim/surround.git
	vim -u NONE -c "helptags surround/doc" -c q

#vim-visual-multi:
#	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

bashrc:
	cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc

all: create_dirs all-packages
	@echo ${mkfile_path}
help:
	@echo 'run `make all` in order to install the complete dev environment'


clean:
	@echo 'TODO: NOT IMPLEMENTED YET'
