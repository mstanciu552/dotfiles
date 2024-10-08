local M = {}

function M.config()
	require("nvim-tree").setup({
		disable_netrw = true,
		hijack_netrw = true,
		-- open_on_setup = true,
		-- ignore_buffer_on_setup = false,
		-- ignore_ft_on_setup = {},
		-- auto_close = true,
		auto_reload_on_write = true,
		open_on_tab = false,
		hijack_cursor = false,
		update_cwd = false,
		hijack_unnamed_buffer_when_opening = false,
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = false,
			update_cwd = false,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 30,
			-- height = 30,
			-- hide_root_folder = false,
			side = "left",
			preserve_window_proportions = false,
			-- mappings = {
			-- 	custom_only = false,
			-- 	list = {},
			-- },
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		actions = {
			change_dir = {
				enable = true,
				global = false,
			},
			open_file = {
				quit_on_open = true,
				resize_window = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
		},
		log = {
			enable = false,
			truncate = false,
			types = {
				all = false,
				config = false,
				git = false,
			},
		},
	})

	vim.g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
	}

	vim.g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "",
			staged = "S",
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "U",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
		},
	}
end

return M
