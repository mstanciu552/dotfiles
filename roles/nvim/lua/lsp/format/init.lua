local M = {}
local lsp_format = require("lsp-format")

M.config = function()
	lsp_format.setup({})
end

return M
