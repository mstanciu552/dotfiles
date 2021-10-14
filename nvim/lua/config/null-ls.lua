local M = {}

M.sources = {
	require("null-ls").builtins.formatting.stylua,
	require("null-ls").builtins.formatting.prettier,
	require("null-ls").builtins.formatting.autopep8,
	require("null-ls").builtins.formatting.shellcheck,
	require("null-ls").builtins.formatting.shfmt,
	require("null-ls").builtins.formatting.clang_format,
	require("null-ls").builtins.formatting.gofmt,
	require("null-ls").builtins.formatting.json_tool,
	require("null-ls").builtins.formatting.rustfmt,
}

function M.on_attach(client)
	-- Format on save
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

function M.config()
	require("null-ls").config({
		sources = M.sources,
		debug = true,
	})
	require("lspconfig")["null-ls"].setup({
		on_attach = M.on_attach,
	})
end

return M
