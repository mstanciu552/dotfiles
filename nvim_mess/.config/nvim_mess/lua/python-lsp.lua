local on_attach = require('lspconfig-conf')

require'lspconfig'.pyright.setup{
  on_attach = on_attach
}
