return {
	{ "folke/lazy.nvim", version = "*" },
	{
		"plumpalbert/nvim-basic",
		priority = 10000,
		lazy = false,
		cond = true,
		config = true,
		version = "*",
	},
	{ import = "nvim-basic.plugins.themes" },
	{ import = "nvim-basic.plugins.lsp" },
}
