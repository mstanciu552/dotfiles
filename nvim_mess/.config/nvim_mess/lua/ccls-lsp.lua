local on_attach = require('lspconfig-conf')

require'lspconfig'.ccls.setup{
  on_attach = on_attach
}

