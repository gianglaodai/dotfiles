return {
	-- amongst your other plugins
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[<C-\>]],
		direction = "float",
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
}
