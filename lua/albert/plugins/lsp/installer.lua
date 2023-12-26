return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = function(_, opts)
		opts = opts or {}
		local ensure_installed = vim.list_extend({
			"lua-language-server",
			"luacheck",
			"stylua",
		}, opts.ensure_installed or {})

		return {
			ensure_installed = ensure_installed,
			auto_update = true,
			run_on_start = true,
			start_delay = 1000,
			debounce_hours = 6,
		}
	end,
}
