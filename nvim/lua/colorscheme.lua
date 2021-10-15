local M = {}

function M.config()
	require("nightfox").load("nightfox")

	vim.cmd("hi SpellBad guifg=none guibg=none cterm=none ctermfg=none ctermbg=none")
end

return M
