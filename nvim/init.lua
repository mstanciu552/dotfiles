vim.g.mapleader = " "

-- Plugins and config files
require('utils')

source('utils/general')
source('plugins')

require('keymappings')
require('colorscheme')

-- GalaxyLine and Bufferline Config
require('galaxyline-conf')
require('bufferline-conf')
require('dashboard-conf')
source('plug-conf/which-key')
-- Ranger config
-- source('plug-conf/rnvimr')

-- Nvim-tree config
require('nvimtree-conf')

-- Telescope Config
require('telescope-conf')

-- Todo Config
require('todo-conf')
require('trouble-conf')

--Treesitter config
require("treesitter-conf")

-- Lsp Config
-- source('plug-conf/lsp-config')
require('lspconfig-conf')
require('lspinstall-conf')

require('compe-config')

require('ccls-lsp')
require('lua-lsp')
require('golang-lsp')
require('python-lsp')
require('rust-lsp')
require('tsserver-lsp')
require('rust_tools')

source('plug-conf/ale-conf')          -- Ale Config
source('plug-conf/floaterm-conf')     -- Floaterm Config
source('plug-conf/fzf-conf')          -- FZF Config
