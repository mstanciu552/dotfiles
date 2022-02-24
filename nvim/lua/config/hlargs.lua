local M = {}

M.config = function()
	require("hlargs").setup {
		color = "#ef9062",
		excluded_filetypes = {},
		paint_arg_declarations = true,
		paint_arg_usages = true,
		performance = {
			parse_delay = 1,
			max_iterations = 400,
		},
	}
end

return M
