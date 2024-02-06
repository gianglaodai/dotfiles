return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvim_tree = require("nvim-tree")
		local api = require("nvim-tree.api")
		local function my_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close"))
		end

		nvim_tree.setup({
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			git = {
				enable = true,
				ignore = true,
				timeout = 500,
			},
			view = {
				width = 30,
				side = "left",
				number = false,
				relativenumber = false,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			actions = {
				open_file = {
					resize_window = true,
					quit_on_open = false,
					window_picker = { enable = true },
				},
			},
			renderer = {
				highlight_git = true,
				root_folder_modifier = ":t",
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "U",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
			},
			on_attach = my_on_attach,
		})
	end,
}
