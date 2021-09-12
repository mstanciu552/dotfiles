local M = {}

function M.config()
  require('lualine').setup {
    options = {
      theme = 'nightfox'
    }
  }
end

return M
