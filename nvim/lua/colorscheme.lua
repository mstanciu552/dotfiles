local M = {}

function M.config()
	require("nightfox").load("nightfox")

	vim.cmd("hi SpellBad guifg=none guibg=none cterm=none ctermfg=none ctermbg=none") -- SpellBad
	vim.cmd("hi IncSearch guibg='#5e81ac' guifg='#abb2bf'") -- Yank highlight
end

return M
