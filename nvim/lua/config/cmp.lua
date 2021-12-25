local M = {
	source_menu = {
		nvim_lsp = "[LSP]",
		nvim_lua = "[API]",
		cmp_octave = "[OCTAVE]",
		cmp_matlab = "[MATLAB]",
		emoji = "[Emoji]",
		rg = "[RG]",
		path = "[Path]",
		calc = "[Calc]",
		cmp_tabnine = "[Tabnine]",
		luasnip = "[Snippet]",
		buffer = "[Buffer]",
	},
}

function M.config()
	local cmp = require "cmp"
	local lspkind = require "lspkind"

	cmp.setup {
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
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
		experimental = {
			ghost_text = true,
		},
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
		mapping = {
			["<CR>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<Tab>"] = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end,
			["<S-Tab>"] = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "cmp_tabnine" },
			{ name = "cmp_octave" },
			{ name = "cmp_matlab" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "rg" },
			{ name = "buffers" },
		},
	}
end

return M
