set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

" to change all tabs to spaces execute the following:
" :set tabstop=4 expandtab
" :retab

set list
set listchars=tab:!·,trail:· " visualize tabs and spaces
set number " show line number
set tabstop=4 " set tabs to equal 4 spaces
match ErrorMsg '\%>80v.\+' " highlight character spast 80 chars
set tabstop=4 shiftwidth=4 expandtab
"this sometimes helps performance when running on
"servers
"set clipboard=exclude:.* 

" F10 to open NERDTree
nmap <F10> :NERDTreeToggle<CR>
"Ctrl+Left scales window to left
nnoremap <C-Left>  <C-w>>
"Ctrl+Right scales window to right
nnoremap <C-Right> <C-w><
"Ctrl+Up scales window up
nmap <C-Up> :res +5<CR>
"Ctrl+Down scales window down
nmap <C-Down> :res -5<CR>

" Personal syntax highlighting for bitbake
au BufReadPost *.bb set syntax=python
au BufReadPost *.bblayer set syntax=python

syntax enable
colorscheme monokai
