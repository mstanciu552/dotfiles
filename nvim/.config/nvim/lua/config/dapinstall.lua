local M = {}

M.config = function()
	local dap_install = require "dap-install"

	dap_install.setup {
		installation_path = vim.fn.stdpath "data" .. "/dapinstall/",
	}
end

return M
