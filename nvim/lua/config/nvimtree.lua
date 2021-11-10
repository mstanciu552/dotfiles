local M = {}

function M.config()
	require("nvim-tree").setup {
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = true,
		ignore_ft_on_setup = {},
		auto_close = true,
		open_on_tab = false,
		-- update_to_buf_dir = true,
		hijack_cursor = true,
		update_cwd = false,
		diagnostics = {
			enable = true,
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},

		view = {
			width = 30,
			side = "left",
			auto_resize = true,
			mappings = {
				custom_only = false,
				list = {},
			},
		},
	}

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
