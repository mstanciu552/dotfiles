local M = {}
local ls = require("luasnip")
local types = require("luasnip.util.types")

function M.config()
	ls.config.set_config({
		history = true,
		updateevents = "TextChanged,TextChangedI",
		enable_autosnippets = true,
		ext_opts = {
			[types.choiceNode] = {
				active = {
					virt_text = { { "<-", "Error" } },
				},
			},
		},
	})
	require("luasnip.loaders.from_vscode").lazy_load()
end

return M
