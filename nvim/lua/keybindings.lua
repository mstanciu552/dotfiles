local M = {}
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

function M.config()
  key('n', ';', ':', { noremap = true, silent = false })
  key('v', ';', ':', { silent = false })

  key('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
  key('n', '<leader>o', ':NvimTreeFind<CR>', {noremap = true, silent = false})

  key('n', '<leader>f', ':lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true, silent = true })
  key('n', '<leader>g', ':lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = true })

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
