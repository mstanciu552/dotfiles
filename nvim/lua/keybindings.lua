local M = {}
local key = vim.api.nvim_set_keymap

function M.config()
  key('n', ';', ':', { noremap = true, silent = false })
  key('v', ';', ':', { silent = false })

  key('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
  key('n', '<leader>o', ':NvimTreeFind<CR>', {noremap = true, silent = false})

  key('n', '<leader>f', ':lua require(\'telescope.builtin\').find_files()<cr>', { noremap = true, silent = true })
  key('n', '<leader>g', ':lua require(\'telescope.builtin\').live_grep()<cr>', { noremap = true, silent = true })
end

return M
