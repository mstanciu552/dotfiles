colorscheme lunar
hi Normal guibg=NONE ctermbg=NONE

hi SpellBad guifg=none guibg=none cterm=none ctermfg=none ctermbg=none 

if g:colors_name == 'nord'
  hi Comment guifg=#8fbcbb
else 
  hi Comment guifg=#556A7B
endif

if g:colors_name == 'one' || g:colors_name == 'onedark'
  let g:onedark_hide_endofbuffer=1
  let g:onedark_termcolors=256
  let g:onedark_terminal_italics=1
endif
