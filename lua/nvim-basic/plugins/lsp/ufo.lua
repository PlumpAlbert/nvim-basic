return {
	"kevinhwang91/nvim-ufo",
	event = { "BufRead", "BufNewFile" },
	dependencies = { "kevinhwang91/promise-async" },
	init = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 150,
			close_fold_kinds = { "imports", "comment" },
		})
	end,
}
