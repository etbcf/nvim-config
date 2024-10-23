-- ALE
------------------------------------------------------------------------------
-- Linter configurations
vim.g.ale_linters = {
  cpp = {},
  c = {},
  sh = {},
}

-- Fixer configurations
vim.g.ale_fixers = {
  ['*'] = { 'trim_whitespace' },
  cpp = { 'clang-format' },
  c = { 'clang-format' },
}

-- Enable fix on save
vim.g.ale_fix_on_save = 1
