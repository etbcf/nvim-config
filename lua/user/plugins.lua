-- Plugins using packer.nvim
-- Ensure you have packer installed: https://github.com/wbthomason/packer.nvim
------------------------------------------------------------------------------
-- Auto-install packer if not present
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Plugins go here
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'  -- Git integration
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim'  -- Lualine statusline
  use 'ryanoasis/vim-devicons'
  use 'sheerun/vim-polyglot'
  use 'dense-analysis/ale'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'honza/vim-snippets'
  use 'jiangmiao/auto-pairs'
  use 'WolfgangMehner/bash-support'
  use { 'akinsho/toggleterm.nvim', tag = '*' }
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.8' }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

