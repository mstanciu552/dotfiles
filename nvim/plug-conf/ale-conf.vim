" Ale settings
let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'typescript': ['prettier'],
    \   'typescriptreact': ['prettier'],
    \   'react': ['prettier'],
    \   'html': ['prettier'],
    \   'jsx': ['prettier'],
    \   'python': ['prettier'],
    \   'rust': ['rustfmt']
\}
let g:ale_fix_on_save = 1

" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma --use-tabs --tab-width 4 all'
" let g:ale_typescript_prettier_options = '--single-quote --trailing-comma --use-tabs --tab-width 4 all'

