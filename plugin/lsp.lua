-- TODO: Keymap

vim.lsp.enable({
	"astro",
	"biome",
	"ccls",
	"cssls",
	"denols",
	"dockerls",
	"emmet_language_server",
	"eslint",
	"gleam",
	"gopls",
	"html",
	"jdtls",
	"jsonls",
	"lua_ls",
	"nil_ls",
	"nushell",
	"ols",
	"pyright",
	"ruff",
	"rust_analyzer",
	"tombi", -- toml
	"tsgo",
	"vtsls",
	"wgsl_analyzer",
	"zls",
})

vim.lsp.config("dockerls", {
	filetypes = { "containerfile", "Containerfile", "dockerfile", "Dockerfile" },
})

vim.lsp.config("jsonls", {
	init_options = {
		provideFormatter = false,
	},
})

vim.lsp.config("pyright", {
	settings = {
		pyright = {
			-- using ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- ignore all files for analysis to exclusively use ruff for linting
				ignore = { "*" },
			},
		},
	},
})

vim.lsp.config("ruff", {
	on_init = function(client) client.server_capabilities.hoverProvider = false end,
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
			},
		},
	},
})

vim.diagnostic.config({ signs = true })

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "g.", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "cd", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "x" }, "<F3>", vim.lsp.buf.format, opts)
	end,
})

require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
