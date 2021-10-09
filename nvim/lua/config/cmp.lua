local M = {}

function M.config()
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				-- For `luasnip` user.
				require("luasnip").lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
		},
		sources = {
			{ name = "buffers" },
			{ name = "nvim_lsp" },
			{ name = "path" },
			{ name = "luasnip" },
		},
	})
end

return M
