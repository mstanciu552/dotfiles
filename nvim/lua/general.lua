local M = {}
function M.emmet()
	vim.g.user_emmet_leader_key = "<C-y>"
end

function M.config()
	vim.cmd([[
  syntax on
  filetype plugin indent on

  set vb t_vb=
  set shortmess+=c
  set formatoptions-=cro
  set clipboard+=unnamedplus

  au InsertEnter * silent execute "!echo -en \<esc>[5 q"
  au InsertLeave * silent execute "!echo -en \<esc>[2 q"
  autocmd BufNew,BufRead *.asm set ft=nasm

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
  augroup END

  ]])

	vim.o.signcolumn = "yes"
	vim.opt.termguicolors = true
	vim.opt.colorcolumn = "120"
	vim.opt.showmode = false
	vim.opt.hidden = true
	vim.opt.modifiable = true
	vim.opt.cursorline = true
	vim.opt.encoding = "utf8"
	vim.opt.exrc = true
	vim.opt.errorbells = false
	vim.opt.hlsearch = false
	vim.opt.incsearch = true
	vim.opt.expandtab = true
	vim.opt.smartindent = true
	vim.opt.wrap = false
	vim.opt.smartcase = true
	vim.opt.swapfile = false
	vim.opt.backup = false
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.mouse = "a"
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.inccommand = "nosplit"

	vim.g.cursorhold_updatetime = "100"
end

return M
