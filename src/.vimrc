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
"set clipboard=exclude:.* " same as running with -X flag. Useful for server

" F10 to open NERDTree
nmap <F10> :NERDTreeToggle<CR>
" horizontal scaling
nnoremap <C-Left>  <C-w><
nnoremap <C-Right> <C-w>>

" Personal syntax highlighting for bitbake
au BufReadPost *.bb set syntax=python
au BufReadPost *.bblayer set syntax=python

" Preferred colors
colors torte

