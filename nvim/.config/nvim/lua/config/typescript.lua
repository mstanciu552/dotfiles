local M = {}

M.config = function()
	require("typescript").setup({
		disable_commands = false,
		disable_formatting = true,
		debug = false,
	})
end

return M
