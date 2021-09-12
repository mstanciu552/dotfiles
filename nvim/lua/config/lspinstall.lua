local M = {}

function M.config()
  require'lspinstall'.setup() -- important

  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end

  require'lspinstall'.post_install_hook = function ()
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
end

return M
