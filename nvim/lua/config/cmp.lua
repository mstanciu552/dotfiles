local M = {
	source_menu = {
		nvim_lsp = "(LSP)",
		emoji = "(Emoji)",
		path = "(Path)",
		calc = "(Calc)",
		cmp_tabnine = "(Tabnine)",
		vsnip = "(Snippet)",
		luasnip = "(Snippet)",
		buffer = "(Buffer)",
	},
}

function M.config()
	local cmp = require("cmp")
	local vim = vim
	local lspkind = require("lspkind")

	cmp.setup({
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			-- 			format = function(entry, vim_item)
			-- 				local icons = lspkind.presets.default
			-- 				vim_item.kind = icons[vim_item.kind]

			-- 				vim_item.menu = M.source_menu[entry.source.name]
			-- 				return vim_item
			-- 			end,
			format = function(entry, vim_item)
				vim_item.kind = lspkind.presets.default[vim_item.kind]
				local menu = M.source_menu[entry.source.name]
				if entry.source.name == "cmp_tabnine" then
					if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
						menu = entry.completion_item.data.detail .. " " .. menu
					end
					vim_item.kind = ""
				end
				vim_item.menu = menu
				return vim_item
			end,
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),
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
			{ name = "cmp_tabnine" },
		},
	})
end

return M
