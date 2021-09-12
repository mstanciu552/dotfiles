vim.g.mapleader = " "

local config = {
  "plugins",
  "general",
  "keybindings",
  "colorscheme",
  "config.nvimtree",
  "config.lualine",
  "config.telescope",
  "config.treesitter",
  "config.lspinstall",
  "config.cmp",
}


for _, config_path in ipairs(config) do
  local cf = require(config_path)
  cf.config()
end
