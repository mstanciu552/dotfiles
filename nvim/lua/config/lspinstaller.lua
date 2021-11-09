local M = {}

M.config = function()
	local lsp_installer = require "nvim-lsp-installer"

	lsp_installer.on_server_ready(function(server)
		local opts = {
			on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end,
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
			-- Lua vim global definition
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "awesome", "describe", "it" },
					},
				},
			},
		}

		server:setup(opts)
	end)
end

return M
