local M = {}

M.config = function()
	vim.api.nvim_command([[
    augroup RemoveWinNewline
      autocmd BufWritePost *.cs silent %s/\r//g
    augroup END
  ]])
end

return M
