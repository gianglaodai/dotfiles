return {
	"ahmedkhalf/project.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local project = require("project_nvim")
		project.setup({

			detection_methods = { "lsp", "pattern" },

			patterns = { ".git", "Makefile", "package.json" },
		})

		local telescope = require("telescope")
		telescope.load_extension("projects")
	end,
}
