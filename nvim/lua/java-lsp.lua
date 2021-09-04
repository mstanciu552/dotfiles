local on_attach = require('lspconfig-conf')

require'lspconfig'.java.setup{
  on_attach = on_attach
}
