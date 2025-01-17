local M = {}
local globals = require("globals")

local config = {
	"lsp.format",
}

local import = function()
	for _, config_path in ipairs(config) do
		local ok, cf = pcall(require, config_path)
		if ok then
			cf.config()
		else
			print(config_path)
		end
	end
end

M.config = function()
	import()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "● ",
			format = function(diagnostic)
				if globals.virtual_text then
					return require("neodim").ignore_vtext(diagnostic)
				end
			end,
		},
		signs = true,
		underline = true,
		update_in_insert = false,
	})
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = globals.underline,
	})
end

return M
