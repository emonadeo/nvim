local languages = {
	"astro",
	"bash",
	"c",
	"clojure",
	"cpp",
	"css",
	"csv",
	"cuda",
	"cue",
	"dart",
	"dockerfile",
	"editorconfig",
	"elixir",
	"erlang",
	"gitignore",
	"gleam",
	"glsl",
	"go",
	"graphql",
	"groovy",
	"hcl",
	"html",
	"ini",
	"java",
	"javascript",
	"jsdoc",
	"json",
	"json5",
	"just",
	"kdl",
	"kotlin",
	"latex",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"meson",
	"nginx",
	"nickel",
	"ninja",
	"nix",
	"nu",
	"ocaml",
	"odin",
	"php",
	"python",
	"query",
	"regex",
	"rust",
	"scss",
	"svelte",
	"swift",
	"toml",
	"tsx",
	"typescript",
	"typespec",
	"typst",
	"vala",
	"vim",
	"vimdoc",
	"vue",
	"wgsl",
	"xml",
	"yaml",
	"zig",
}

-- Install
local isnt_installed = function(lang) return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 end
local to_install = vim.tbl_filter(isnt_installed, languages)
if #to_install > 0 then require("nvim-treesitter").install(to_install) end

-- Enable
local filetypes = vim.iter(languages):map(vim.treesitter.language.get_filetypes):flatten():totable()
vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev) vim.treesitter.start(ev.buf) end,
})

-- TODO: Rework keymap
require("nvim-treesitter-textobjects").setup({
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			-- ["ao"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Select Outer Block",
			-- },
			-- ["io"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Select Inner Block",
			-- },
			["am"] = { query = "@function.outer", desc = "Select Outer Function" },
			["im"] = { query = "@function.inner", desc = "Select Inner Function" },
			["af"] = { query = "@function.outer", desc = "Select Outer Function" },
			["if"] = { query = "@function.inner", desc = "Select Inner Function" },
			["ac"] = { query = "@class.outer", desc = "Select Outer Class" },
			["ic"] = { query = "@class.inner", desc = "Select Inner Class" },
			["ia"] = { query = "@parameter.inner", desc = "Select Argument" },
			["ai"] = { query = "@conditional.outer", desc = "Select Outer Conditional" },
			["ii"] = { query = "@conditional.inner", desc = "Select Inner Conditional" },
		},
	},
	swap = {
		enable = true,
		swap_next = {
			["<leader>a"] = { query = "@parameter.inner", desc = "Swap Next Argument" },
		},
		swap_previous = {
			["<leader>A"] = {
				query = "@parameter.inner",
				desc = "Swap Previous Argument",
			},
		},
	},
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			-- ["]o"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Next Block Start",
			-- },
			["]m"] = { query = "@function.outer", desc = "Next Function Start" },
			["]f"] = { query = "@function.outer", desc = "Next Function Start" },
			["]c"] = { query = "@class.outer", desc = "Next Class Start" },
			["]s"] = {
				query = "@scope",
				query_group = "locals",
				desc = "Next Scope Start",
			},
			["]z"] = {
				query = "@fold",
				query_group = "folds",
				desc = "Next Fold Start",
			},
		},
		goto_next_end = {
			-- ["]O"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Next Block End",
			-- },
			["]M"] = { query = "@function.outer", desc = "Next Function End" },
			["]F"] = { query = "@function.outer", desc = "Next Function End" },
			["]C"] = { query = "@class.outer", desc = "Next Class End" },
			["]S"] = {
				query = "@scope",
				query_group = "locals",
				desc = "Next Scope End",
			},
			["]Z"] = { query = "@fold", query_group = "folds", desc = "Next Fold end" },
		},
		goto_previous_start = {
			-- ["[o"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Previous Block Start",
			-- },
			["[m"] = { query = "@function.outer", desc = "Previous Function Start" },
			["[f"] = { query = "@function.outer", desc = "Previous Function Start" },
			["[c"] = { query = "@class.outer", desc = "Previous Class Start" },
			["[s"] = {
				query = "@scope",
				query_group = "locals",
				desc = "Previous Scope Start",
			},
			["[z"] = {
				query = "@fold",
				query_group = "folds",
				desc = "Previous Fold Start",
			},
		},
		goto_previous_end = {
			-- ["[O"] = {
			-- 	query = { "@block.outer", "@conditional.outer", "@loop.outer" },
			-- 	desc = "Previous Block End",
			-- },
			["[M"] = { query = "@function.outer", desc = "Previous Function End" },
			["[F"] = { query = "@function.outer", desc = "Previous Function End" },
			["[C"] = { query = "@class.outer", desc = "Previous Class End" },
			["[S"] = {
				query = "@scope",
				query_group = "locals",
				desc = "Previous Scope End",
			},
			["[Z"] = {
				query = "@fold",
				query_group = "folds",
				desc = "Previous Fold End",
			},
		},
	},
})
