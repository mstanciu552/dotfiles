local M = {}

M.config = function()
	if vim.bo.filetype ~= "matlab" then
		return
	end
	require("lsp_matlab").setup {}
end

return M
