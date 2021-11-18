-- @Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
local globals = require "globals"

local M = {}

-- Check out nvim-comment
-- TODO Replace nvim-lspinstall with nvim-lsp-installer
function M.config()
	require("config.packer_opts").config()
	return require("packer").startup(function(use)
		use "wbthomason/packer.nvim"
		use {
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		}

		use "EdenEast/nightfox.nvim"
		use "folke/tokyonight.nvim"

		use {
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		}

		use {
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		}

		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		}
		use "p00f/nvim-ts-rainbow"
		use "nvim-treesitter/playground"

		use { "neovim/nvim-lspconfig" }
		use "williamboman/nvim-lsp-installer"
		-- use({ "tami5/lspsaga.nvim" }) -- For neovim 0.6
		use { "rinx/lspsaga.nvim" }

		use {
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path",
				"lukas-reineke/cmp-rg",
				"mstanciu552/cmp-octave",
				"mstanciu552/cmp-matlab",
			},
		}

		use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

		use { "ap/vim-css-color" }
		use "windwp/nvim-autopairs"

		use { "folke/which-key.nvim" }

		use {
			"NTBBloodbath/galaxyline.nvim",
			branch = "main",
			disable = true,
		}

		use { "nvim-lualine/lualine.nvim", disable = false }

		use {
			"terrortylor/nvim-comment",
			config = function()
				require("nvim_comment").setup { comment_empty = false }
			end,
		}

		use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }
		use "mattn/emmet-vim"
		use "christianchiarulli/nvcode-color-schemes.vim"
		use "jose-elias-alvarez/null-ls.nvim"
		use "L3MON4D3/LuaSnip"
		use "saadparwaiz1/cmp_luasnip"
		use "rafamadriz/friendly-snippets"
		use "onsails/lspkind-nvim"
		use "tanvirtin/monokai.nvim"
		use "antoinemadec/FixCursorHold.nvim"
		use "martinsione/darkplus.nvim"

		use "tpope/vim-surround"

		use {
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup()
			end,
		}

		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		}

		use {
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		}

		use "ellisonleao/glow.nvim"
		use {
			"kaputi/e-kaput.nvim",
			disable = not globals.ekaput,
		}

		use { "mstanciu552/lsp_matlab", disable = not globals.lsp_matlab }

		use "mfussenegger/nvim-dap"
		use "Pocco81/DAPInstall.nvim"

		use "ggandor/lightspeed.nvim"
		use "nvim-neorg/neorg"
	end)
end
return M
