local M = {}
function M.config()
	require("lspinstall").setup() -- important

	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
		require("lspconfig")[server].setup({
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end,
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
			-- Lua vim global definition
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "awesome" },
					},
				},
			},
		})
	end

	require("lspinstall").post_install_hook = function()
		vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
	end
end

return M
