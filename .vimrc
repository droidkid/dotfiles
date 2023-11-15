" From https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'xuhdev/vim-latex-live-preview'
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set smarttab
set nu
set rnu

autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
