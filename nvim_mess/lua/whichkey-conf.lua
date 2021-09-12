vim.api.nvim_set_keymap('n', '<leader>', ":silent WhichKey '<Space>'<CR>", {noremap = true, silent = true})

require("whichkey_setup").config{
    hide_statusline = false,
    default_keymap_settings = {
        silent=true,
        noremap=true,
    },
    default_mode = 'n',
}

