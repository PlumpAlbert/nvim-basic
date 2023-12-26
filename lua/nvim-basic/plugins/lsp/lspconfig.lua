return {
	"neovim/nvim-lspconfig",
	event = { "BufRead", "BufNewFile" },
	keys = {
		{ "<leader>lI", "<cmd>LspInfo<cr>", desc = "LSP info" },
	},
}
