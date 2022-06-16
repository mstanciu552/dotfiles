local M = {}

M.config = function()
  local ok, mkdnflow = pcall(require, 'mkdnflow')
  if not ok then return end
  mkdnflow.setup{}
end

return M
