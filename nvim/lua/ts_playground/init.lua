local parsers = require "nvim-treesitter.parsers"
local ts_util = require "nvim-treesitter.ts_utils"

local get_input = require("utils").get_input

local M = {}

M.get_node_at_cursor = function(bufnr)
	assert(parsers.has_parsers(parsers.get_buf_lang(bufnr)), "File has no parsers")
	local root = parsers.get_tree_root(bufnr)

	local cursor = vim.api.nvim_win_get_cursor(bufnr)
	local row = cursor[1]
	local col = cursor[2]

	return root:named_descendant_for_range(row - 1, col, row - 1, col)
end

M.find_all_similar_nodes = function(node)
	local node = node or M.get_node_at_cursor(0)

	local node_text = ts_util.get_node_text(node)[1]
	local new_text = get_input {
		prompt = "New name: ",
		default = node_text,
	}

	print(new_text)
	vim.api.nvim_command("%s/" .. node_text .. "/" .. new_text .. "/g")
end

return M
