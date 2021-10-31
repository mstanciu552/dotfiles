local M = {}
local loop = vim.loop

M.colorscheme = "tokyonight"
M.ekaput = true

M.split = function(str, delimiter)
	local split = {}
	for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(split, match)
	end
	return split
end

M.new_file = function()
	local fpath = vim.fn.input("New File: ", vim.fn.getcwd(), "file")
	local fname = M.split(fpath, "/")[#M.split(fpath, "/")]
	vim.api.nvim_command("redraw") -- Refresh the prompt
	-- TODO Check if exists
	-- TODO Create file
	loop.fs_mkdir(fname, fpath)
	print(fpath .. " created")
end

return M
