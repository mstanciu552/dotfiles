local utils = require "utils"
local globals = require "globals"

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

	-- No idea why it's not working
	key("i", "jk", utils.t "<esc>l", { noremap = true, silent = false })
	key("i", "jj", utils.t "<esc>l", { noremap = true, silent = true })

	-- NvimTree
	key("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	key("n", "<leader>o", ":NvimTreeFind<CR>", { noremap = true, silent = true })

	-- Telescope
	if globals.telescope_theme == "normal" then
		key("n", "<leader>f", ":lua require('telescope.builtin').find_files()<cr>", { noremap = true, silent = true })
		key("n", "<leader>g", ":lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })
		key("n", "<leader>s", ":lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })
	elseif globals.telescope_theme == "dropdown" then
		key(
			"n",
			"<leader>f",
			":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>",
			{ noremap = true, silent = true }
		)
		key(
			"n",
			"<leader>g",
			":lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>",
			{ noremap = true, silent = true }
		)
		key(
			"n",
			"<leader>s",
			":lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown({}))<cr>",
			{ noremap = true, silent = true }
		)
	end

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
	key("n", "<leader>ca", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", opts)
	key("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	key("n", "<leader>a", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
	key("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	key("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	key("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	key("n", "<leader>wf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- Glow
	if vim.bo.filetype == "markdown" then
		key("n", "<leader>m", "<cmd>Glow<CR>", { noremap = true, silent = true })
	end

	-- New file
	key("n", "<leader>n", "<cmd>lua require('globals').new_file()<CR>", opts)

	-- Toggle virtual text LSP
	key("n", "<leader>x", "<cmd>lua require('globals').toggle_virtual()<CR>", { noremap = true, silent = true })

	-- Window splitting
	key("n", "<leader>=", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
	key("n", "<leader>-", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })
	key("n", "<leader><Tab>", "<C-w>w", { noremap = true, silent = true })
end

return M
