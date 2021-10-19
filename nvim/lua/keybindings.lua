local M = {}
local key = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }

function M.config()
	key("n", ";", ":", { noremap = true, silent = false })
	key("v", ";", ":", { silent = false })
	key("n", "Y", "y$", { noremap = true, silent = true })

	key("n", "<leader>'", "ysiw'", { noremap = false, silent = false })
	key("n", '<leader>"', 'ysiw"', { noremap = false, silent = false })
	key("n", "<leader>{", "ysiw}", { noremap = false, silent = false })
	key("n", "<leader>[", "ysiw]", { noremap = false, silent = false })
	key("n", "<leader>(", "ysiw)", { noremap = false, silent = false })

	key("v", ">", ">gv", {})
	key("v", "<", "<gv", {})

	key("i", "<S-Down>", "<cmd>m +1<CR>", { expr = false })
	key("i", "<S-Up>", "<cmd>m -2<CR>", { expr = false })
	key("n", "<S-Up>", "<cmd>m -2<CR>", { noremap = true })
	key("n", "<S-Down>", "<cmd>m +1<CR>", { noremap = true })
	key("v", "<S-Up>", ":'<,'>m -2<CR>gv", { noremap = true })
	key("v", "<S-Down>", ":'<,'>m +1<CR>gv", { noremap = true })

	key("i", "jk", "<ESC>", { noremap = true, expr = true })
	key("i", "kj", "<ESC>", { noremap = true, expr = true })
	key("i", "jj", "<ESC>", { noremap = true, expr = true })

	-- NvimTree
	key("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	key("n", "<leader>o", ":NvimTreeFind<CR>", { noremap = true, silent = true })

	-- Telescope
	key("n", "<leader>f", ":lua require('telescope.builtin').find_files()<cr>", { noremap = true, silent = true })
	key("n", "<leader>g", ":lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })

	-- LSP
	key("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	key("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	key("n", "<C-f>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
	key("n", "<C-b>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)
	key("n", "K", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", opts)
	key("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	key("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	key("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	key("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	key("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	key("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	key("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	key("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	key("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	key("n", "<leader>a", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
	key("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	key("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	key("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	key("n", "<leader>wf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- Lspsaga
	key("n", "<leader>lf", ":lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
	key("n", "<leader>lc", ":lua require'lspsaga.codeaction'.code_action()<CR>", opts)
end

return M