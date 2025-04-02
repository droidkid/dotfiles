" From https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
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
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/goyo.vim'
" Plugin 'airblade/vim-gitgutter'
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

" set bg=light
set cursorline
colorscheme gruvbox "PaperColor is also good

set statusline+=%{gutentags#statusline()}
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

nnoremap <C-P> :GFiles<CR>
set diffopt+=vertical

" Wrap lines for Markdown and LaTeX files only
" autocmd FileType markdown setlocal columns=86
" autocmd FileType tex setlocal columns=86
" autocmd FileType markdown setlocal linebreak
" autocmd FileType tex setlocal linebreak
" autocmd FileType tex Goyo 80x100%

