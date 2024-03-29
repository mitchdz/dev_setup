# I like to use regolith
# https://regolith-linux.org/download/

CONFIGS_PREFIX="src"
STAGING="${HOME}/.mitchdz_dev_setup"
mkdir -p ${STAGING}
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.vim/colors
mkdir -p ${HOME}/.vim/pack/tpope/start

# install dependencies
sudo apt-get update -y
sudo apt-get install -y \
	vim \
	build-essential \
	cmake \
	python3-dev \
	git \
	zsh \
	curl \
	fonts-powerline # for omz agnoster theme

# vim-monokai font
git clone https://github.com/sickill/vim-monokai ${STAGING}/vim-monokai
cp ${STAGING}/vim-monokai/colors/monokai.vim ${HOME}/.vim/colors/

# Vundle
cp ${CONFIGS_PREFIX}/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YCM - not used atm because most servers do not have a late enough vim :(
#cd ~/.vim/bundle/YouCompleteMe
#python3 install.py --clangd-completer
#cd -

# vim-surround
cd ${HOME}/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
cd -

# Vundle invocation
vim +PluginInstall +qall

# bashrc
cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc

# zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh --unattended --keep-zshrc
\cp ${CONFIGS_PREFIX}/zshrc ~/.zshrc

# Remove staging folder
rm -rf ${STAGING}
