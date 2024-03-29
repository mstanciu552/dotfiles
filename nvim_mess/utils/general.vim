syntax on
filetype plugin indent on

set exrc
set spell
set nohlsearch
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set vb t_vb=
set termguicolors
set encoding=utf-8
set noshowmode
set hidden
set shortmess+=c
set formatoptions-=cro
set modifiable
set clipboard+=unnamedplus
set colorcolumn=120
set mouse=a
set inccommand=nosplit
set cursorline

au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
autocmd BufNew,BufRead *.asm set ft=nasm

" Installing vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

