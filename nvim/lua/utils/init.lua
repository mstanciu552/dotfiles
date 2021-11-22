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
	vim.api.nvim_command "redraw"
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

utils.get_input = function(params)
	local input = vim.fn.input(params.prompt, params.default, "file")
	utils.clear_prompt()
	return input
end

utils.t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return utils
