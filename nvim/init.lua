vim.g.mapleader = " "

local config = {
  "plugins",
  "general",
  "keybindings",
  "colorscheme",
  "config.barbar",
  "config.nvimtree",
  "config.galaxyline",
  "config.telescope",
  "config.treesitter",
  "config.lspinstall",
  "config.cmp",
  "config.which-key",
}


for _, config_path in ipairs(config) do
  local cf = require(config_path)
  cf.config()
end
