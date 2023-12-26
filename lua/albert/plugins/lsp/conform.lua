return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
				})
			end,
			mode = "n",
			desc = "Format file",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function(_, opts)
		opts = opts or {}
		local formatters_by_ft = vim.tbl_extend(
			"force",
			{ lua = { "stylua" } },
			opts.formatters_by_ft or {}
		)

		require("conform").setup(vim.tbl_extend("force", opts, {
			format_on_save = {
				timeout_ms = 350,
				lsp_fallback = true,
			},
			formatters_by_ft = formatters_by_ft,
		}))
	end,
}
