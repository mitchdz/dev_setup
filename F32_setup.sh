set -o xtrace #print each command before executing it

CONFIGS_PREFIX="src"
STAGING="${HOME}/.mitchdz_dev_setup"
mkdir -p ${STAGING}
mkdir -p ${HOME}/.config
mkdir -p ${HOME}/.vim/colors
mkdir -p ${HOME}/.config/terminator
mkdir -p ${HOME}/.vim/pack/tpope/start

# install dependencies
#sudo apt-get update -y
#sudo apt-get install -y vim build-essential cmake python3-dev terminator git

dnf install -y util-linux-user # for chsh command
dnf install -y zsh

# vim-monokai is corrupting YCM https://github.com/ycm-core/YouCompleteMe/issues/3464
# vim-monokai font
#git clone https://github.com/sickill/vim-monokai ${STAGING}/vim-monokai
#cp ${STAGING}/vim-monokai/colors/monokai.vim ${HOME}/.vim/colors/

# Vundle
\cp ${CONFIGS_PREFIX}/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YCM - not used atm because most servers do not have a late enough vim :(
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer --force-sudo
cd -

# vim-surround
cd ${HOME}/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
cd -

# Vundle invocation
vim +PluginInstall +qall

# Terminator config
cp ./${CONFIGS_PREFIX}/terminator/config ${HOME}/.config/terminator/config

# bashrc endings # TODO: remove as using zsh now
cat ${CONFIGS_PREFIX}/bashrc_ending.txt >> ~/.bashrc

# zshrc
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --skip-chsh --unattended --keep-zshrc
\cp ${CONFIGS_PREFIX}/zshrc ~/.zshrc

# Remove staging folder
#rm -rf ${STAGING}
