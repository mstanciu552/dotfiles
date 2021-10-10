-- Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

local M = {}

-- TODO Add null-ls
-- TODO Add comment.nvim
function M.config()
	return require("packer").startup(function(use)
		use("wbthomason/packer.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use("EdenEast/nightfox.nvim")
		use("sbdchd/neoformat")

		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		use({
			"nvim-telescope/telescope.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})

		use({ "neovim/nvim-lspconfig" })
		use({ "kabouzeid/nvim-lspinstall" })
		use({ "glepnir/lspsaga.nvim" })

		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/vim-vsnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
			},
		})

		use({ "ap/vim-css-color" })
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		use({ "folke/which-key.nvim" })

		use({
			"glepnir/galaxyline.nvim",
			branch = "main",
		})

		use({
			"terrortylor/nvim-comment",
			config = function()
				require("nvim_comment").setup({ comment_empty = false })
			end,
		})

		use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

		use({ "mattn/emmet-vim" })

		use({
			"dense-analysis/ale",
			ft = { "sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex" },
			cmd = "ALEEnable",
			config = "vim.cmd[[ALEEnable]]",
		})
		use({ "christianchiarulli/nvcode-color-schemes.vim" })

		-- use({
		-- 	"ahmedkhalf/jupyter-nvim",
		-- 	run = ":UpdateRemotePlugins",
		-- })
		use("bfredl/nvim-ipy")
		use("jose-elias-alvarez/null-ls.nvim")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")
		use("onsails/lspkind-nvim")
	end)
end

return M
