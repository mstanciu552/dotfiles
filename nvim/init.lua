vim.g.mapleader = " "

local config = {
	"plugins",
	"general",
	"keybindings",
	"colorscheme",
	"config.bufferline",
	"config.nvimtree",
	"config.null-ls",
	"config.galaxyline",
	-- "config.jupyter",
	"config.luasnip",
	"config.telescope",
	"config.treesitter",
	"config.lspinstall",
	"config.lspsaga",
	"config.cmp",
	"config.which-key",
}

for _, config_path in ipairs(config) do
	local cf = require(config_path)
	cf.config()
end
