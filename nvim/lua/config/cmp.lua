local M = {}

function M.config()
	local cmp = require("cmp")
	local vim = vim
	local lspkind = require("lspkind")

	cmp.setup({
		snippet = {
			expand = function(args)
				-- For `luasnip` user.
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				local icons = lspkind.presets.default
				vim_item.kind = icons[vim_item.kind]

				vim_item.menu = ({
					nvim_lsp = "(LSP)",
					emoji = "(Emoji)",
					path = "(Path)",
					calc = "(Calc)",
					cmp_tabnine = "(Tabnine)",
					vsnip = "(Snippet)",
					luasnip = "(Snippet)",
					buffer = "(Buffer)",
				})[entry.source.name]

				-- 				vim_item.dup = ({
				-- 					buffer = 1,
				-- 					path = 1,
				-- 					nvim_lsp = 1,
				-- 				})[entry.source.name] or 0

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
		},
	})
end

return M
