local M = {}

local add_parser = function(path_or_repo)
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.zimbu = {
		install_info = {
			url = path_or_repo,
			files = { "src/parser.c" },
		},
		filetype = "matlab", -- if filetype does not agrees with parser name
	}
end

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = true,
		},
		rainbow = {
			enable = true,
			extended_mode = false,
			max_file_lines = nil,
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	})

	add_parser("~/Documents/Projects/Neovim/tree-sitter-matlab")
end

return M
