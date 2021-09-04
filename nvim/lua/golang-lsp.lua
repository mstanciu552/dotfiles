local on_attach = require('lspconfig-conf')

require'lspconfig'.gopls.setup{
  on_attach = on_attach
}
