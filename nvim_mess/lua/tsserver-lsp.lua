local on_attach = require('lspconfig-conf')

require'lspconfig'.tsserver.setup{
  on_attach = on_attach
}

require'lspconfig'.typescript.setup{
  on_attach = on_attach
}
