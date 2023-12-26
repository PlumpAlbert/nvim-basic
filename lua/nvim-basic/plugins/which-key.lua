return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function(_, opts)
		opts = opts or {}
		require("which-key").setup(vim.tbl_extend("force", {
			key_labels = {
				["<leader>l"] = "+LSP",
			},
		}, opts))
	end,
}
