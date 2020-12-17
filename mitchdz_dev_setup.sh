# I like to use regolith
# https://regolith-linux.org/download/

CONFIGS_PREFIX="src"
STAGING="~/.mitchdz_dev_setup/"

mkdir -p ${STAGING}

# install dependencies
sudo apt-get update -y
sudo apt-get install -y vim build-essential cmake python3-dev terminator

# YouCompleteMe
cp ${CONFIGS_PREFIX}/.vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
cd -

# vim-surround
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
cd -

# Vundle invocation
vim +PluginInstall +qall

# Terminator config
mkdir -p ~/.fonts/
git clone https://github.com/powerline/fonts ${STAGING}
cp -r ${STAGING}/UbuntuMono ~/.fonts/
mkdir -p ~/.config/terminator
cp ./${CONFIGS_PREFIX}/terminator/config ~/.config/terminator/config

# bashrc
cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc

# Remove staging folder
rm -rf ${STAGING}
