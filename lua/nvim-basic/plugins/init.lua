return {
	{
		"plumpalbert/nvim-basic",
		priority = 10000,
		lazy = false,
		cond = true,
		config = true,
		version = "*",
	},
	{ "folke/lazy.nvim", version = "*" },
	{ import = "nvim-basic.plugins.themes" },
	{ import = "nvim-basic.plugins.lsp" },
}
