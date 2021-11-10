local globals = require "globals"

local M = {}

M.config = function()
	local theme = "galaxyline.themes." .. globals.statusline
	require(theme)
end

return M
