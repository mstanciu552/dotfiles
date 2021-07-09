vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    left_trunk_marker = '',
    right_trunk_marker = '',
    diagnostics = "nvim-lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"..level
    end,
  }
}
