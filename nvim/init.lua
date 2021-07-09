vim.g.mapleader = " "

-- Plugins and config files
require('utils')
<<<<<<< HEAD
require('keymappings')
require('colorscheme')
=======
>>>>>>> e83cc8f (nvim tree)

source('utils/general')
source('plugins')

<<<<<<< HEAD
=======
require('keymappings')
require('colorscheme')

>>>>>>> e83cc8f (nvim tree)
-- GalaxyLine and Bufferline Config
require('galaxyline-conf')
require('bufferline-conf')

-- Ranger config
-- source('plug-conf/rnvimr')

-- Nvim-tree config
require('nvimtree-conf')

-- Telescope Config
source('plug-conf/telescope-conf')

-- Lsp Config
source('plug-conf/lsp-config')

require('compe-config')

require('ccls-lsp')
require('lua-lsp')
require('golang-lsp')
require('python-lsp')
require('rust-lsp')
require('tsserver-lsp')

source('plug-conf/ale-conf')          -- Ale Config
source('plug-conf/floaterm-conf')     -- Floaterm Config
source('plug-conf/fzf-conf')          -- FZF Config

