return {
	"olimorris/onedarkpro.nvim",
	priority = 99,
	lazy = true,
	opts = {
		types = "italic",
		keywords = "italic",
		virtual_text = "italic",
	},
	plugins = {
		gitsigns = true,
		lsp_semantic_tokens = true,
		nvim_cmp = true,
		nvim_lsp = true,
		nvim_ts_rainbow = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
	options = {
		cursorline = false,
		transparency = true,
		terminal_colors = true,
		highlight_inactive_windows = false,
	},
}
