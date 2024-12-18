local M = {}

local add_parser = function(path_or_repo)
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.matlab = {
		install_info = {
			url = path_or_repo,
			files = { "src/parser.c" },
			branch = "main",
		},
	}
end

function M.config()
	add_parser("https://github.com/mstanciu552/tree-sitter-matlab.git")
	add_parser("https://github.com/nvim-neorg/tree-sitter-norg")

	require("nvim-treesitter.configs").setup({
		ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
			enable = true, -- false will disable the whole extension
			additional_vim_regex_highlighting = true,
		},
		autotag = {
			enable = true,
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
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
		},
	})
end

return M
