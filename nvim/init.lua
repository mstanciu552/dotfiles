local fn = vim.fn
local execute = vim.api.nvim_command
local globals = require("globals")

vim.g.mapleader = " "

-- TODO Fix mini.nvim
local config = {
	"plugins",
	"general",
	"keybindings",
	"colorscheme",
	"config.autopairs",
	"config.cmp",
	"config.ekaput",
	"config.scrollbar",
	"config.hlargs",
	"config.mini",
	-- "config.markdown",
	"config.nvimtree",
	"config.null-ls",
	"config.lua_line",
	"config.gitsigns",
	"config.luasnip",
	"config.telescope",
	"config.treesitter",
	"config.typescript",
	"config.lspinstaller",
	-- "config.dapinstall",
	"config.rust-tools",
	"config.lspsaga",
	"config.tabnine",
	"utils.autocmds",

	"lsp",
}

if globals.lsp_matlab then
	table.insert(config, "config.matlab")
end

if globals.bufferline then
	table.insert(config, "config.bufferline")
end

if globals.which_key then
	table.insert(config, "config.which-key")
end

if globals.theme ~= false then
	table.insert(config, "highlights")
end

if globals.colorscheme == "catppuccin" then
	table.insert(config, "config.catppuccin")
end

if globals.colorscheme == "github" then
	table.insert(config, "config.github-theme")
end

for _, config_path in ipairs(config) do
	local ok, cf = pcall(require, config_path)
	if ok then
		cf.config()
	else
		print(config_path)
	end
end
