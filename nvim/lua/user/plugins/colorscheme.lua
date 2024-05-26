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
return {
	"ribru17/bamboo.nvim",
	lazy = false,
	priority = 9999,
	config = function()
		vim.cmd([[colorscheme bamboo]])
	end,
}
