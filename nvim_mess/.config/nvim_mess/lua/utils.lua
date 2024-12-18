function source(path)
  local absolute_path = '$HOME/.config/nvim/' .. path

  vim.cmd('source '..absolute_path..'.vim')
end
