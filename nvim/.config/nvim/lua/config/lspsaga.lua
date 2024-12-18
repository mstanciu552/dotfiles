local icons = require("utils.icons").signs

local M = {}

function M.config()
	require("lspsaga").init_lsp_saga {
		use_saga_diagnostic_sign = true,
		error_sign = icons.Error,
		warn_sign = icons.Warn,
		hint_sign = icons.Hint,
		infor_sign = icons.Info,
	}
end

return M
