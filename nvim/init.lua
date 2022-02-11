local fn = vim.fn
local execute = vim.api.nvim_command
local globals = require "globals"

vim.g.mapleader = " "

local config = {
	"plugins",
	"general",
	"keybindings",
	"colorscheme",
	"config.autopairs",
	"config.cmp",
	"config.ekaput",
	"config.scrollbar",
	"config.mini",
	"config.nvimtree",
	"config.null-ls",
	"config.lua_line",
	"config.gitsigns",
	"config.luasnip",
	"config.telescope",
	"config.treesitter",
	"config.lspinstaller",
	"config.dapinstall",
	"config.lspsaga",
	"config.tabnine",
	-- "config.trouble",
	"config.which-key",
}

if globals.lsp_matlab then
	table.insert(config, "config.matlab")
end

if globals.bufferline then
	table.insert(config, "config.bufferline")
end

for _, config_path in ipairs(config) do
	local ok, cf = pcall(require, config_path)
	if ok then
		cf.config()
	else
		print(config_path)
	end
end
