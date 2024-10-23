-- Lualine Configuration
require('lualine').setup {
  options = {
    theme = 'tokyonight',  -- Change to your preferred theme
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree', 'dashboard' },  -- Disable on specific filetypes
  },
  sections = {
    lualine_a = { 'mode' },  -- Mode (e.g., Normal, Insert, etc.)
    lualine_b = { 'branch', 'diff' },  -- Git branch and diff
    lualine_c = { 'filename', 'filesize' },  -- Filename and size
    lualine_x = { 'encoding', 'fileformat', 'filetype' },  -- File details
    lualine_y = { 'location' },  -- Current cursor location
    lualine_z = { 'progress' },  -- Progress indicator
  },
  tabline = {
    lualine_a = { 'buffers' },  -- Shows buffer list
    lualine_b = { 'tabs' },  -- Shows tabs
    lualine_c = {},
  },
  extensions = { 'nvim-tree', 'fugitive' },  -- Add any extensions you need
}

