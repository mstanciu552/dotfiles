-- @Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
local globals = require("globals")
local fn = vim.fn

local M = {}

function M.config()
	-- Automatically install packer
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		PACKER_BOOTSTRAP = fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.notify("Installing packer...close and reopen Neovim...")
		vim.cmd([[packadd packer.nvim]])
	end

	require("config.packer_opts").config()
	return require("packer").startup(function(use)
		use("wbthomason/packer.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use("EdenEast/nightfox.nvim")
		use("folke/tokyonight.nvim")
		use("rebelot/kanagawa.nvim")
		use("andersevenrud/nordic.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("p00f/nvim-ts-rainbow")
		use("nvim-treesitter/playground")
		use("windwp/nvim-ts-autotag")
		use({
			"nvim-orgmode/orgmode",
			ft = { "org" },
			config = function()
				require("orgmode").setup_ts_grammar()
				require("orgmode").setup({})
			end,
		})

		use({ "neovim/nvim-lspconfig" })
		use("williamboman/nvim-lsp-installer")
		use({ "tami5/lspsaga.nvim" })
		-- use { "rinx/lspsaga.nvim" }
		use("jose-elias-alvarez/typescript.nvim")
		use("lukas-reineke/lsp-format.nvim")
		use("simrat39/rust-tools.nvim")

		use({
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
		})

		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

		use("ap/vim-css-color")
		use("windwp/nvim-autopairs")

		use({
			"NTBBloodbath/galaxyline.nvim",
			branch = "main",
			disable = true,
		})

		use({ "nvim-lualine/lualine.nvim" })

		use({
			"terrortylor/nvim-comment",
			config = function()
				require("nvim_comment").setup({ comment_empty = false })
			end,
		})

		use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use("mattn/emmet-vim")
		use("christianchiarulli/nvcode-color-schemes.vim")
		use("NTBBloodbath/doom-one.nvim")
		use({
			"catppuccin/nvim",
			as = "catppuccin",
		})
		use("projekt0n/github-nvim-theme")
		use("jose-elias-alvarez/null-ls.nvim")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")
		use("onsails/lspkind-nvim")
		use("tanvirtin/monokai.nvim")
		use("antoinemadec/FixCursorHold.nvim")
		use("martinsione/darkplus.nvim")

		use("tpope/vim-surround")

		use({
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup()
			end,
		})

		-- use {
		-- 	"folke/trouble.nvim",
		-- 	requires = "kyazdani42/nvim-web-devicons",
		-- 	disable = true,
		-- }

		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})

		use("ellisonleao/glow.nvim")
		use({ "mstanciu552/lsp_matlab", disable = not globals.lsp_matlab })

		use("mfussenegger/nvim-dap")
		use("Pocco81/DAPInstall.nvim")

		use("tpope/vim-fugitive")
		use("lervag/vimtex")
		use("petertriho/nvim-scrollbar")
		use({ "echasnovski/mini.nvim" })
		use("m-demare/hlargs.nvim")

		use("rcarriga/nvim-notify")
		use("Djancyp/cheat-sheet")
		use("lambdalisue/suda.vim")
		use({
			"zbirenbaum/neodim",
			config = function()
				require("neodim").setup()
			end,
		})

		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end)
end
return M
