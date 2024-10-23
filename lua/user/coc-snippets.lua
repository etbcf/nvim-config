-- Coc Snippets Configuration in Lua
------------------------------------------------------------------------------

-- Use <C-l> for trigger snippet expand
vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(coc-snippets-expand)', { noremap = false, silent = true })

-- Use <C-j> for select text for visual placeholder of snippet
vim.api.nvim_set_keymap('v', '<C-j>', '<Plug>(coc-snippets-select)', { noremap = false, silent = true })

-- Use <C-j> for jump to next placeholder (default of coc.nvim)
vim.g.coc_snippet_next = '<C-j>'

-- Use <C-k> for jump to previous placeholder (default of coc.nvim)
vim.g.coc_snippet_prev = '<C-k>'

-- Use <C-j> for both expand and jump (make expand higher priority)
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(coc-snippets-expand-jump)', { noremap = false, silent = true })

-- Use <leader>x for convert visual selected code to snippet
vim.api.nvim_set_keymap('x', '<leader>x', '<Plug>(coc-convert-snippet)', { noremap = false, silent = true })

-- In insert mode, use <TAB> for completion
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? coc#_select_confirm() : coc#expandableOrJumpable() ? "\\<C-r>=coc#rpc#request(\'doKeymap\', [\'snippets-expand-jump\',\'\'])\\<CR>" : v:lua.check_back_space() ? "\\<TAB>" : coc#refresh()', { noremap = false, expr = true, silent = true })

-- Function to check backspace
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or string.match(vim.fn.getline('.'), '.-' .. string.rep(' ', col - 1) .. '$') ~= nil
end

-- Reassigning the key for snippet next
vim.g.coc_snippet_next = '<tab>'

