local M = {}

M.colorscheme = "tokyonight"
M.ekaput = false
M.virtual_text = true

local statusline_options = {
	"eviline",
	"neonline",
	"spaceline",
}
M.statusline = statusline_options[1]

M.lsp_matlab = true

M.rename_file = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local new_name = vim.fn.input("New File: ", fname, "file")

	local ok, err, code = os.rename(fname, new_name)

	if not err then
		if code == 13 then
			vim.api.nvim_err_writeln "Permissions issue"
		end
	end
	print(ok)
end

-- TODO Fix this
M.toggle_virtual_text = function()
	vim.api.nvim_buf_attach(0, false, {
		on_lines = function()
			M.virtual_text = not M.virtual_text
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
				underline = true,
				virtual_text = M.virtual_text,
			})
		end,
	})
end

return M
