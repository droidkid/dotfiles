" From https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
"#Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'cjuniet/clang-format.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-endwise'
Plugin 'rstacruz/vim-closer'
Plugin 'preservim/vim-indent-guides'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'preservim/tagbar'
Plugin 'vim-autoformat/vim-autoformat'
Plugin 'gruvbox-community/gruvbox' 
Plugin 'airblade/vim-gitgutter'
Plugin 'NLKNguyen/papercolor-theme'
call vundle#end()            " required
filetype plugin indent on    " required

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set smarttab
set nu
set rnu
set foldmethod=manual

set bg=light
set cursorline
colorscheme PaperColor

set statusline+=%{gutentags#statusline()}
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

nnoremap <C-P> :GFiles<CR>
set diffopt+=vertical
