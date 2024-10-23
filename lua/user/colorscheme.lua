local colorscheme_gnome = "tokyonight-night"
local colorscheme_tilix = "tokyonight-storm"

-- Check if Tilix-specific environment variable is present
local is_tilix = vim.env.TILIX_ID ~= nil
local desktop_env = vim.env.XDG_CURRENT_DESKTOP or ""

if is_tilix then
  vim.cmd("colorscheme " .. colorscheme_tilix)
elseif desktop_env:match("GNOME") then
  vim.cmd("colorscheme " .. colorscheme_gnome)
else
  -- Fallback to one of the themes if the terminal is not detected
  vim.cmd("colorscheme " .. colorscheme_gnome)
end

