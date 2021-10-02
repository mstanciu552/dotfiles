local M = {}
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

function M.config()
  key('n', ';', ':', { noremap = true, silent = false })
  key('v', ';', ':', { silent = false })

  key('v', '>', '>gv', {})
  key('v', '<', '<gv', {})

  key('i', '<S-Down>', '<cmd>m +1<CR>', { expr = false })
  key('i', '<S-Up>', '<cmd>m -2<CR>', { expr = false })
  key('n', '<S-Up>', '<cmd>m -2<CR>', { noremap = true })
  key('n', '<S-Down>', '<cmd>m +1<CR>', { noremap = true })
  key('v', '<S-Up>', ':\'<,\'>m -2<CR>gv', { noremap = true })
  key('v', '<S-Down>', ':\'<,\'>m +1<CR>gv', { noremap = true })

  key('i', 'jk', '<ESC>', { noremap = true, expr = true })
  key('i', 'kj', '<ESC>', { noremap = true, expr = true })
  key('i', 'jj', '<ESC>', { noremap = true, expr = true })

  -- NvimTree
  key('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
  key('n', '<leader>o', ':NvimTreeFind<CR>', {noremap = true, silent = false})

  -- Telescope
  key('n', '<leader>f', ':lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true, silent = true })
  key('n', '<leader>g', ':lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = true })

  -- LSP
  key('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  key('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  key('n', 'K', '<cmd>lua require\'lspsaga.provider\'.render_hover_doc()<CR>', opts)
  key('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  key('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  key('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  key('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  key('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  key('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  key('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  key('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  key('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  key('n', '<leader>a', '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>', opts)
  key('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  key('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  key('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  key('n', '<leader>wf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


  -- Lspsaga
  key('n', '<leader>lf', '<cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>', opts)
  key('n', '<leader>lc', '<cmd>lua require\'lspsaga.codeaction\'.code_action()<CR>', opts)


  -- Move to previous/next
  key('n', '<A-,>', ':BufferPrevious<CR>', opts)
  key('n', '<A-.>', ':BufferNext<CR>', opts)
  -- Re-order to previous/next
  key('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
  key('n', '<A->>', ' :BufferMoveNext<CR>', opts)
  -- Goto buffer in position...
  key('n', '<A-1>', ':BufferGoto 1<CR>', opts)
  key('n', '<A-2>', ':BufferGoto 2<CR>', opts)
  key('n', '<A-3>', ':BufferGoto 3<CR>', opts)
  key('n', '<A-4>', ':BufferGoto 4<CR>', opts)
  key('n', '<A-5>', ':BufferGoto 5<CR>', opts)
  key('n', '<A-6>', ':BufferGoto 6<CR>', opts)
  key('n', '<A-7>', ':BufferGoto 7<CR>', opts)
  key('n', '<A-8>', ':BufferGoto 8<CR>', opts)
  key('n', '<A-9>', ':BufferGoto 9<CR>', opts)
  key('n', '<A-0>', ':BufferLast<CR>', opts)
  -- Close buffer
  key('n', '<A-c>', ':BufferClose<CR>', opts)
  -- Wipeout buffer
  --                 :BufferWipeout<CR>
  -- Close commands
  --                 :BufferCloseAllButCurrent<CR>
  --                 :BufferCloseBuffersLeft<CR>
  --                 :BufferCloseBuffersRight<CR>
  -- Magic buffer-picking mode
  key('n', '<C-p>', ':BufferPick<CR>', opts)
  -- Sort automatically by...
  key('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
  key('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
  key('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

  -- Other:
  -- :BarbarEnable - enables barbar (enabled by default)
  -- :BarbarDisable - very bad command, should never be used

end

return M
