local M = {}


function M.config()
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'buffers' },
      { name = 'nvim_lsp' },
      { name = 'path' },
    }
  })
end

return M
