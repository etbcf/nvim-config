-- Coc Explorer
------------------------------------------------------------------------------

-- Key mapping for opening Coc Explorer
vim.api.nvim_set_keymap('n', '<space>e', ':CocCommand explorer<CR>', { noremap = true, silent = true })

-- Set Coc Explorer global presets
vim.g.coc_explorer_global_presets = {
    ['.vim'] = {
        ['root-uri'] = '~/.vim',
    },
    ['cocConfig'] = {
        ['root-uri'] = '~/.config/coc',
    },
    ['tab'] = {
        ['position'] = 'tab',
        ['quit-on-open'] = true,
    },
    ['tab:$'] = {
        ['position'] = 'tab:$',
        ['quit-on-open'] = true,
    },
    ['floating'] = {
        ['position'] = 'floating',
        ['open-action-strategy'] = 'sourceWindow',
    },
    ['floatingTop'] = {
        ['position'] = 'floating',
        ['floating-position'] = 'center-top',
        ['open-action-strategy'] = 'sourceWindow',
    },
    ['floatingLeftside'] = {
        ['position'] = 'floating',
        ['floating-position'] = 'left-center',
        ['floating-width'] = 50,
        ['open-action-strategy'] = 'sourceWindow',
    },
    ['floatingRightside'] = {
        ['position'] = 'floating',
        ['floating-position'] = 'right-center',
        ['floating-width'] = 50,
        ['open-action-strategy'] = 'sourceWindow',
    },
    ['simplify'] = {
        ['file-child-template'] = '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
    },
    ['buffer'] = {
        ['sources'] = { { name = 'buffer', expand = true } }
    },
}

-- Use preset argument to open different explorer presets
vim.api.nvim_set_keymap('n', '<space>ed', ':CocCommand explorer --preset .vim<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ef', ':CocCommand explorer --preset floating<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>ec', ':CocCommand explorer --preset cocConfig<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<space>eb', ':CocCommand explorer --preset buffer<CR>', { noremap = true, silent = true })

-- List all presets
vim.api.nvim_set_keymap('n', '<space>el', ':CocList explPresets<CR>', { noremap = true, silent = true })
