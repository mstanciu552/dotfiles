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
	"config.luasnip",
	"config.telescope",
	"config.treesitter",
	"config.lspinstall",
	"config.lspsaga",
	"config.tabnine",
	"config.which-key",
}

for _, config_path in ipairs(config) do
	local cf = require(config_path)
	cf.config()
end
