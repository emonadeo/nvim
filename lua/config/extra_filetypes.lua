vim.filetype.add({
	pattern = {
		[".*/dockerfile"] = "dockerfile",
		[".*/dockerfile%.%a+"] = "dockerfile",
		[".*/containerfile"] = "dockerfile",
		[".*/containerfile%.%a+"] = "dockerfile",
	},
})
