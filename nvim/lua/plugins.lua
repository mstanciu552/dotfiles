-- Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

local M = {}

-- Check out nvim-comment
-- TODO Replace nvim-lspinstall with nvim-lsp-installer
function M.config()
	require("packer").init({
		ensure_dependencies = true, -- Should packer install plugin dependencies?
		max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
		auto_clean = true, -- During sync(), remove unused plugins
		compile_on_sync = true, -- During sync(), run packer.compile()
		disable_commands = false, -- Disable creating commands
		opt_default = false, -- Default to using opt (as opposed to start) plugins
		transitive_opt = true, -- Make dependencies of opt plugins also opt by default
		transitive_disable = true, -- Automatically disable dependencies of disabled plugins
		auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
		git = {
			cmd = "git", -- The base command for git operations
			subcommands = { -- Format strings for git subcommands
				update = "pull --ff-only --progress --rebase=false",
				install = "clone --depth %i --no-single-branch --progress",
				fetch = "fetch --depth 999999 --progress",
				checkout = "checkout %s --",
				update_branch = "merge --ff-only @{u}",
				current_branch = "branch --show-current",
				diff = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
				diff_fmt = "%%h %%s (%%cr)",
				get_rev = "rev-parse --short HEAD",
				get_msg = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
				submodules = "submodule update --init --recursive --progress",
			},
			depth = 1, -- Git clone depth
			clone_timeout = 60, -- Timeout, in seconds, for git clones
			default_url_format = "https://github.com/%s", -- Lua format string used for "aaa/bbb" style plugins
		},
		display = {
			non_interactive = false, -- If true, disable display windows for all operations
			open_fn = require("packer.util").float, -- An optional function to open a window for packer's display
			open_cmd = "65vnew \\[packer\\]", -- An optional command to open a window for packer's display
			working_sym = "⟳", -- The symbol for a plugin being installed/updated
			error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
			done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
			removed_sym = "-", -- The symbol for an unused plugin which was removed
			moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
			header_sym = "━", -- The symbol for the header line in packer's display
			show_all_info = true, -- Should packer show all update details automatically?
			prompt_border = "double", -- Border style of prompt popups.
			keybindings = { -- Keybindings for the display window
				quit = "q",
				toggle_info = "<CR>",
				diff = "d",
				prompt_revert = "r",
			},
		},
		luarocks = {
			python_cmd = "python", -- Set the python command to use for running hererocks
		},
		log = { level = "warn" }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
		profile = {
			enable = true,
			threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
		},
	})

	return require("packer").startup(function(use)
		use("wbthomason/packer.nvim")
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use("EdenEast/nightfox.nvim")

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
		-- use({ "tami5/lspsaga.nvim" }) -- For neovim 0.6
		use({ "rinx/lspsaga.nvim" }) -- For neovim 0.5

		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/vim-vsnip",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path",
			},
		})
		use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

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
		use({ "christianchiarulli/nvcode-color-schemes.vim" })
		use("jose-elias-alvarez/null-ls.nvim")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")
		use("onsails/lspkind-nvim")
		use("tanvirtin/monokai.nvim")
		use("antoinemadec/FixCursorHold.nvim") -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
		use("martinsione/darkplus.nvim")

		use("tpope/vim-surround")

		use({
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup()
			end,
		})

		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})

		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
		})
	end)
end

return M
