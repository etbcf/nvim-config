-- COC (Conquer of Completion)
------------------------------------------------------------------------------
-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Convert Vimscript 'let g:' into Lua
vim.g.coc_global_extensions = { 'coc-snippets', 'coc-sh', 'coc-clangd', 'coc-pyright', 'coc-html', 'coc-css', 'coc-explorer' }

-- Some servers have issues with backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- Reduce update time for better performance
vim.opt.updatetime = 300

-- Always show the sign column
vim.opt.signcolumn = "yes"

-- Setup key mappings
local keyset = vim.keymap.set

-- Autocomplete with Tab
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', opts)

-- Accept completion with Enter
keyset("i", "<cr>", 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', opts)

-- Trigger snippets with Ctrl-j
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Diagnostics navigation
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Show documentation
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight symbol under cursor on CursorHold
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting code
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Setup formatexpr for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr for specific filetypes"
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply code actions
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Scroll float windows with <C-f> and <C-b>
keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', {silent = true, expr = true})
keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', {silent = true, expr = true})

-- Format the current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

