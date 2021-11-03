local utils = {}

utils.source = function(path)
	local absolute_path = "$HOME/.config/nvim/" .. path
	vim.cmd("source " .. absolute_path .. ".vim")
end

utils.split = function(str, delimiter)
	local split = {}
	-- String splitting in lua
	for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(split, match)
	end
	return split
end

utils.get_user_input_char = function()
	local c = vim.fn.getchar()
	while type(c) ~= "number" do
		c = vim.fn.getchar()
	end
	return vim.fn.nr2char(c)
end

utils.clear_prompt = function()
	vim.api.nvim_command("redraw") -- Refresh the prompt
end

utils.check_path_exists = function(path)
	local ok, err, code = os.rename(path, path)
	if not ok then
		if code == 13 then
			-- Permission denied, but exists
			return true
		end
	end
	return ok, err
end

utils.is_dir = function(path)
	return utils.check_path_exists(path .. "/")
end

utils.mkdir = function(fdir, write_file, fpath)
	local loop = vim.loop
	loop.fs_mkdir(
		fdir,
		755,
		vim.schedule_wrap(function(err, status)
			vim.api.nvim_command("!chmod -R 755 " .. fdir)
			write_file(fpath)
		end)
	)
end

return utils
