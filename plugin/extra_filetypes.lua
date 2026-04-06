vim.filetype.add({
	extension = {
		wgsl = "wgsl",
		hip = "cuda",
	},
	pattern = {
		[".*/dockerfile"] = "dockerfile",
		[".*/dockerfile%.%a+"] = "dockerfile",
		[".*/containerfile"] = "dockerfile",
		[".*/containerfile%.%a+"] = "dockerfile",
	},
})
