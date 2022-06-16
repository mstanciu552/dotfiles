local globals = require("globals")
local null_ls = require("null-ls")

local M = {
	border = {
		{ "🭽", "FloatBorder" },
		{ "▔", "FloatBorder" },
		{ "🭾", "FloatBorder" },
		{ "▕", "FloatBorder" },
		{ "🭿", "FloatBorder" },
		{ "▁", "FloatBorder" },
		{ "🭼", "FloatBorder" },
		{ "▏", "FloatBorder" },
	},
	sources = {
		null_ls.builtins.formatting.stylua.with({
			extra_args = { "--config-path", vim.fn.expand("~/.config/stylua/stylua.toml") },
		}),
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.goimports,
		null_ls.builtins.formatting.json_tool,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.clang_format.with({
			filetypes = { "java" },
		}),
		-- null_ls.builtins.formatting.latexindent.with {
		-- 	filetypes = { "tex", "plaintex" },
		-- },

		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint_d,

		-- null_ls.builtins.diagnostics.chktex.with {
		-- 	filetypes = { "tex", "plaintex" },
		-- },
	},
}

function M.on_attach(client)
	-- Format on save
	if client.resolved_capabilities.document_formatting and globals.format_on_save then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		vim.cmd([[
		        augroup LspFormatting
		            autocmd! * <buffer>
		            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
		        augroup END
		]])
	end
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = M.border })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{ border = M.border }
	)
end

function M.config()
	null_ls.setup({
		sources = M.sources,
		debug = true,
		on_attach = M.on_attach,
	})
end

return M
