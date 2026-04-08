require("blink.cmp").keymap = {
	preset = "none",
	["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
	-- BUG: Cannot select next or prev when completion menu is hidden
	["<C-h>"] = { "hide", "snippet_backward", "fallback" },
	["<C-j>"] = { "select_next", "fallback" },
	["<C-k>"] = { "select_prev", "fallback" },
	["<C-l>"] = { "accept", "snippet_forward", "fallback" },
	["<C-u>"] = { "scroll_documentation_up", "fallback" },
	["<C-d>"] = { "scroll_documentation_down", "fallback" },
	["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
}
