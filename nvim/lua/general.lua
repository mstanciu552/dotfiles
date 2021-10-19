local M = {}

function M.emmet()
	vim.g.user_emmet_leader_key = "<C-y>"
end

function M.ale()
	vim.cmd([[ 
  let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \   'python': ['black'],
    \   'html': ['prettier'],
    \}  

  ]])
	vim.g.ale_fix_on_save = 1
end

function M.config()
	vim.cmd([[
  syntax on
  filetype plugin indent on

  set exrc
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
  set shortmess+=c
  set formatoptions-=cro
  set modifiable
  set clipboard+=unnamedplus
  set colorcolumn=120
  set mouse=a
  set inccommand=nosplit
  set cursorline
  set hidden
  set noshowmode

  au InsertEnter * silent execute "!echo -en \<esc>[5 q"
  au InsertLeave * silent execute "!echo -en \<esc>[2 q"
  autocmd BufNew,BufRead *.asm set ft=nasm

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
  augroup END

  let g:cursorhold_updatetime = 100

  ]])

	vim.o.signcolumn = "yes"
end

return M
