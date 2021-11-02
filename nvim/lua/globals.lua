local M = {}

M.colorscheme = "tokyonight"
M.ekaput = false
M.virtual_text = true

local write_file = function(fpath)
	local loop = vim.loop
	local lib = require("nvim-tree.lib")

	loop.fs_open(
		fpath,
		"w",
		755,
		vim.schedule_wrap(function(err, fd)
			if err then
				vim.api.nvim_err_writeln(err)
			else
				loop.fs_close(fd)
				lib.refresh_tree(true)
			end
		end)
	)
	print(fpath .. " created")
end

M.new_file = function()
	local loop = vim.loop
	local utils = require("utils")

	local cwd = vim.fn.getcwd()
	local fpath = vim.fn.input("New File: ", cwd, "file")
	local split_table = utils.split(fpath, "/")
	table.remove(split_table, #split_table)
	local fdir = table.concat(split_table, "/") .. "/"
	utils.clear_prompt()

	if loop.fs_access(fpath, "r") then
		print("File already exists. Overwrite? y/n")
		local ans = utils.get_user_input_char()
		utils.clear_prompt()

		if ans ~= "y" then
			return
		end
	end
	if not utils.is_dir(fpath) then
		utils.mkdir(fdir, write_file, fpath)
	else
		write_file(fpath)
	end
end

M.rename_file = function()
	local fname = vim.api.nvim_buf_get_name(0)
	local new_name = vim.fn.input("New File: ", fname, "file")

	local ok, err, code = os.rename(fname, new_name)

	if not err then
		if code == 13 then
			vim.api.nvim_err_writeln("Permissions issue")
		end
	end
	print(ok)
end

-- TODO Fix this
M.toggle_virtual_text = function()
	vim.api.nvim_buf_attach(0, false, {
		on_lines = function()
			M.virtual_text = not M.virtual_text
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(
					vim.lsp.diagnostic.on_publish_diagnostics,
					{
						underline = true,
						virtual_text = M.virtual_text,
					}
				)
		end,
	})
end

return M
