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
set colorcolumn=72
set mouse=a

au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
autocmd BufNew,BufRead *.asm set ft=nasm

" Installing vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

source $HOME/.config/nvim/plugins.vim

" Colorschemes
source $HOME/.config/nvim/utils/colorscheme.vim

" Lualine config
" luafile $HOME/.config/nvim/lua/lualine-conf.lua

" Galaxyline config
luafile $HOME/.config/nvim/lua/galaxyline-conf.lua

" BufferLine config
luafile $HOME/.config/nvim/lua/bufferline-conf.lua

" Airline config
" source $HOME/.config/nvim/plug-conf/airline-conf.vim

" FZF config
source $HOME/.config/nvim/plug-conf/fzf-conf.vim

" Ranger config
source $HOME/.config/nvim/plug-conf/rnvimr.vim

" Floaterm config
source $HOME/.config/nvim/plug-conf/floaterm-conf.vim

let mapleader = " "

" Emmet settings
let g:user_emmet_leader_key='<C-Y>'

" LSP config
source $HOME/.config/nvim/plug-conf/lsp-config.vim

" TODO Add conditional loading
luafile $HOME/.config/nvim/lua/ccls-lsp.lua
luafile $HOME/.config/nvim/lua/golang-lsp.lua
luafile $HOME/.config/nvim/lua/python-lsp.lua
luafile $HOME/.config/nvim/lua/rust-lsp.lua
luafile $HOME/.config/nvim/lua/tsserver-lsp.lua

" Compe config
luafile $HOME/.config/nvim/lua/compe-config.lua

" Telescope config
source $HOME/.config/nvim/plug-conf/telescope-conf.vim

source $HOME/.config/nvim/plug-conf/ale-conf.vim
source $HOME/.config/nvim/plug-conf/jslsp.vim

luafile $HOME/.config/nvim/keymappings.lua
