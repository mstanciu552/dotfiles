-- Key mappings
-- Recommended keymaps `Code Smell`
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true, silent = false})
vim.api.nvim_set_keymap('v', ';', ':', {silent = false})

vim.api.nvim_set_keymap('n', '<leader>`', 'ysiw`', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>"', 'ysiw"', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', "<leader>'", "ysiw'", {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>(', 'ysiw)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>[', 'ysiw]', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>{', 'ysiw}', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader><', 'ysiw>', {noremap = false, silent = true})

vim.api.nvim_set_keymap('n', '<leader>/', 'gcc', {noremap = false, silent = false})

vim.api.nvim_set_keymap('n', '<leader>sct', ':nmap<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vrc', ':tabnew ~/.config/nvim/init.vim<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sop', ':source %', {noremap = true, silent = true})

-- Window Splitting
vim.api.nvim_set_keymap('n', '<A-RIGHT>',   '<C-w>v', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-DOWN>',    '<C-w>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-LEFT>',    '<C-W>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-RIGHT>',   '<C-W>l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-UP>',      '<C-W>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-DOWN>',    '<C-W>j', {noremap = true, silent = true})

-- Normal mappings
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeToggle<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>o', ':NvimTreeFind<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>=', ':vertical resize +5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -5<CR>', {noremap = true, silent = true})
