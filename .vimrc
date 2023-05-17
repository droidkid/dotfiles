filetype on
filetype indent on
filetype plugin on
syntax on

set nu
set rnu

" From https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set smarttab

autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" mkdir -p ~/.vim/pack/vendor/start
" git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
" git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/pack/vendor/start/ctrlp
