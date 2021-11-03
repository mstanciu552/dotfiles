local M = {}
local globals = require("globals")

M.config = function()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = not globals.ekaput,
	})
	if globals.ekaput then
		require("e-kaput").setup({
			-- defaults
			enabled = globals.ekaput, -- true | false,  Enable EKaput.
			transparency = 25, -- 0 - 100 , transparecy percentage.
			borders = true, -- true | false, Borders.
			error_sign = "", -- Error sign.
			warning_sign = "", -- Warning sign.
			information_sign = "", -- Information sign.
			hint_sign = "", -- Hint sign.
		})
	end
end

return M
