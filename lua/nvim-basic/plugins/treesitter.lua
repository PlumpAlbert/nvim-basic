return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gis",
					node_incremental = "]sn",
					scope_incremental = "]ss",
					node_decremental = "<BS>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookagead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
					},
				},
			},
			indent = { enable = true },
		})
	end,
}
