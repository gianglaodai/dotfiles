return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope-live-grep-args.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
			},
			extensions = {
				auto_quoting = true,
				mappings = {
					i = {
						["<C-k>"] = actions.quote_prompt(),
						["<C-i>"] = actions.quote_prompt({ postfix = " --iglob " }),
						["<C-space>"] = actions.to_fuzzy_refine,
					},
				},
			},
		})

		telescope.load_extension("live_grep_args")
	end,
}
