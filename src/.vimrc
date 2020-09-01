set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

set list
set listchars=tab:!·,trail:· " visualize tabs and spaces
set number " show line number
set tabstop=4 " set tabs to equal 4 spaces
match ErrorMsg '\%>80v.\+' " highlight character spast 80 chars
"set clipboard=exclude:.* " same as running with -X flag. Useful for server

nmap <F10> :NERDTreeToggle<CR>

au BufReadPost *.bb set syntax=python
au BufReadPost *.bblayer set syntax=python

colors torte
