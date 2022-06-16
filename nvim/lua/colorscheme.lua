local M = {
	menu_colors = {
		CmpItemAbbr = "grey",
		CmpItemAbbrDeprecated = "#f1c40f",
		CmpItemAbbrMatchFuzzy = "#2980b9",
		CmpItemKind = "#3498db",
		CmpItemMenu = "#7f8fa6",
	},
}
local globals = require("globals")

M.menu_highlight = function()
	for group, color in pairs(M.menu_colors) do
		if color then
			vim.highlight.create(group, { guifg = color }, false)
		end
	end
end

function M.config()
	M.menu_highlight()

	vim.cmd("hi SpellBad guifg=none guibg=none cterm=none ctermfg=none ctermbg=none")
	vim.cmd("hi IncSearch guibg='#5e81ac' guifg='#abb2bf'")

	if globals.colorscheme ~= "catppuccin" then
		pcall(require, globals.colorscheme)
	end
  if globals.colorscheme == "github" then 
	vim.cmd("colorscheme " .. globals.colorscheme .. "_dark")
  else
	vim.cmd("colorscheme " .. globals.colorscheme)
end

	if globals.transparent then
		vim.cmd("hi Normal guibg=None ctermbg=None")
		vim.cmd("hi CursorLine guibg=#2c323c")
		vim.cmd("hi SignColumn guibg=#1A1B26")
		vim.cmd("hi TabLineFill guibg=#1A1B26")
		vim.cmd("hi TabLineSel guibg=#2C323C")
	end
end

return M
