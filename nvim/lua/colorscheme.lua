local M = {
	menu_colors = {
		CmpItemAbbr = "grey",
		CmpItemAbbrDeprecated = "red",
		CmpItemAbbrMatchFuzzy = "blue",
		CmpItemKind = nil,
		CmpItemMenu = "blue",
	},
}

M.menu_highlight = function()
	for group, color in pairs(M.menu_colors) do
		if color then
			vim.highlight.create(group, { guifg = color }, false)
		end
	end
end

function M.config()
	M.menu_highlight()

	require("nightfox").load("nightfox")

	vim.cmd("hi SpellBad guifg=none guibg=none cterm=none ctermfg=none ctermbg=none") -- SpellBad
	vim.cmd("hi IncSearch guibg='#5e81ac' guifg='#abb2bf'") -- Yank highlight
end

return M
