-- TODO: Consider mini.pick (claims better perf)
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"neovim/nvim-lspconfig",
		"folke/todo-comments.nvim",
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			entry_prefix = " ",
			winblend = vim.opt.winblend:get(),
		},
		extensions = {
			fzf = {},
		},
		pickers = {
			find_files = {
				-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("todo-comments")
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
		return {
			{ "<leader>fb", builtin.buffers, desc = "Buffers" },
			{ "<leader>ff", builtin.find_files, desc = "Files" },
			{ "<leader>fg", builtin.live_grep, desc = "Grep" },
			{ "<leader>fc", builtin.colorscheme, desc = "Colorschemes" },
			{ "<leader>fd", builtin.diagnostics, desc = "Diagnostics" },
			{ "<leader>fs", builtin.lsp_document_symbols, desc = "Symbols" },
			{ "<leader>fS", builtin.lsp_workspace_symbols, desc = "Symbols (Workspace)" },
			{ "<leader>fr", builtin.lsp_references, desc = "References" },
			{ "<leader>ft", extensions["todo-comments"].todo, desc = "Todos" },
			{ "<leader>f.", builtin.resume, desc = "Resume" },
		}
	end,
}
