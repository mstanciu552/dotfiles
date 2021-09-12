local M = {}

function M.config()

  vim.g.nvim_tree_auto_open       = 1
  vim.g.nvim_tree_hide_dotfiles   = 0
  vim.g.nvim_tree_lsp_diagnostics = 1
  vim.g.nvim_tree_quit_on_open    = 1
  vim.g.nvim_tree_tab_open        = 1
  vim.g.nvim_tree_disable_netrw   = 1

  vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "",
      staged = "S",
      unmerged = "",
      renamed = "➜",
      deleted = "",
      untracked = "U",
      ignored = "◌",
    },
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
    },
  }

end

return M
