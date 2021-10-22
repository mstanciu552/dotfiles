local M = {
	menu_colors = {
		CmpItemAbbr = "grey",
		CmpItemAbbrDeprecated = "#f1c40f",
		CmpItemAbbrMatchFuzzy = "#2980b9",
		CmpItemKind = "#3498db",
		CmpItemMenu = "#7f8fa6",
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
