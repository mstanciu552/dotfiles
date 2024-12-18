local signs = require("utils.icons").signs

local M = {}

M.define_signs = function()
	for t, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. t
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end
end

M.emmet = function()
	vim.g.user_emmet_leader_key = "<C-y>"
end

M.config = function()
	vim.cmd([[
  syntax on
  filetype plugin indent on

  set vb t_vb=
  set smartindent
  set autoindent
  set smarttab
  set formatoptions-=cro

  sign define DiagnosticsSignError       text= ● texthl=DiagnosticError   linehl= numhl=
  sign define DiagnosticsSignWarning     text= ● texthl=DiagnosticWarn    linehl= numhl=
  sign define DiagnosticsSignInformation text= ● texthl=DiagnosticInfo    linehl= numhl=
  sign define DiagnosticsSignHint        text= ● texthl=DiagnosticHint    linehl= numhl=

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
  augroup END

  ]])

	vim.o.signcolumn = "yes"
	vim.o.clipboard = "unnamed,unnamedplus"
	vim.o.shortmess = vim.o.shortmess .. "c"
	vim.opt.termguicolors = true
	-- vim.opt.colorcolumn = "120"
	vim.opt.showmode = false
	vim.o.hidden = false
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
	vim.opt.relativenumber = false
	vim.opt.mouse = "a"
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.showtabline = 2
	vim.opt.inccommand = "nosplit"
	vim.opt.autoindent = true
	vim.o.wrap = true
	vim.g.fileformats = "unix,dos"
  vim.opt.list = true

	vim.o.guifont = "UbuntuMono Nerd Font:h24"

	vim.g.cursorhold_updatetime = "100"
end

return M
