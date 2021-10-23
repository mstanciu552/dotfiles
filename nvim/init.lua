local fn = vim.fn
local execute = vim.api.nvim_command

vim.g.mapleader = " "

local config = {
	"plugins",
	"general",
	"keybindings",
	"colorscheme",
	"config.bufferline",
	"config.cmp",
	"config.nvimtree",
	"config.null-ls",
	"config.galaxyline",
	"config.gitsigns",
	"config.luasnip",
	"config.telescope",
	"config.treesitter",
	"config.lspinstall",
	"config.lspsaga",
	"config.tabnine",
	"config.trouble",
	"config.which-key",
}

local install_path = fn.stdpath("data") .. "site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone --depth 1 https://github.com/wbthomason/packer.nvim " .. install_path)
end

for _, config_path in ipairs(config) do
	local ok, cf = pcall(require, config_path)
	if ok then
		cf.config()
	else
		execute("lua print( " .. config_path .. ")")
	end
end
