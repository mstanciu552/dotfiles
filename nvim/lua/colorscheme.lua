vim.cmd("colorscheme darkplus")

vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi SpellBad guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE')

vim.cmd('au ColorScheme * hi SpellBad guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE')
vim.cmd('au ColorScheme * hi Normal ctermbg=NONE guibg=NONE')
