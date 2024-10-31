-- return {
--   "navarasu/onedark.nvim",
--   priority = 9999,
--   config = function()
--     vim.cmd([[colorscheme onedark]])
--   end,
-- }
-- return {
-- 	"robertmeta/nofrils",
-- 	priority = 9999,
-- 	config = function()
-- 		vim.cmd([[colorscheme nofrils-sepia]])
-- 	end,
-- }
-- return {
-- 	"ribru17/bamboo.nvim",
-- 	lazy = false,
-- 	priority = 9999,
-- 	config = function()
-- 		vim.cmd([[colorscheme bamboo]])
-- 	end,
-- }
-- return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	priority = 9999,
-- 	config = function()
-- 		vim.cmd([[colorscheme catppuccin]])
-- 	end,
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 9999,
  opts = {
    style = "night",
    light_style = "night",
    transparent = true,
    terminal_colors = true
  },
  config = function()
    vim.cmd([[colorscheme tokyonight-night]])
  end,
}
-- return {
--   'maxmx03/solarized.nvim',
--   lazy = false,
--   priority = 1000,
--   ---@type solarized.config
--   opts = {},
--   config = function(_, opts)
--     vim.o.termguicolors = true
--     vim.o.background = 'light'
--     require('solarized').setup(opts)
--     vim.cmd.colorscheme 'solarized'
--   end,
-- }
