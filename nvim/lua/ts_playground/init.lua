local parsers = require "nvim-treesitter.parsers"
local ts_util = require "nvim-treesitter.ts_utils"
local locals = require "nvim-treesitter.locals"

local get_input = require("utils").get_input

local M = {}

M.get_node_at_cursor = function(bufnr)
	local bufnr = bufnr or vim.api.nvim_get_current_buf()
	-- assert(parsers.has_parsers(parsers.get_buf_lang(bufnr)), "File has no parsers")
	local root = parsers.get_tree_root(bufnr)

	local cursor = vim.api.nvim_win_get_cursor(bufnr)
	local row = cursor[1]
	local col = cursor[2]

	return root:named_descendant_for_range(row - 1, col, row - 1, col)
end

-- Works only current in current buffer
M.get_definition_of_node = function(bufnr)
	local bufnr = bufnr or 0
	local definitions = locals.get_definitions(bufnr)
	local node = M.get_node_at_cursor(bufnr)
	local node_text = M.get_text_value(node)
	local final_definitions = {}
	local positions = {}

	for _, def in ipairs(definitions) do
		if def.var then
			local definition_text = ts_util.get_node_text(def.var.node)[1]
			if definition_text == node_text then
				table.insert(final_definitions, def.var.node)
			end
		end
	end

	assert(#final_definitions ~= 0, "No definitions found")

	for _, definition_node in pairs(final_definitions) do
		local start_row, start_col, end_row, end_col = definition_node:range()

		local start = { line = start_row, character = start_col }
		local end_position = { line = end_row, character = end_col }

		positions[definition_node] = {}
		positions[definition_node]["start"] = start
		positions[definition_node]["end"] = end_position
	end
end

M.get_text_value = function(node)
	local node_text = ts_util.get_node_text(node)[1]
	return node_text
end

M.find_all_similar_nodes = function(node)
	local node = node or M.get_node_at_cursor(0)

	local node_text = M.get_text_value(node)
	local new_text = get_input {
		prompt = "New name: ",
		default = node_text,
	}

	print(new_text)
	vim.api.nvim_command("%s/" .. node_text .. "/" .. new_text .. "/g")
end

return M
