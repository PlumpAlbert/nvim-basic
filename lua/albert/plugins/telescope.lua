local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	event = "BufEnter",
	cmd = { "Telescope" },
}

M.opts = {
	defaults = {
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
}

M.keys = {
	{
		"<leader><space>",
		function()
			require("telescope.builtin").find_files(require("telescope.themes").get_dropdown())
		end,
		desc = "Find file",
	},
	{
		"<leader>/",
		function()
			require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown())
		end,
		desc = "Find word",
	},
	{
		"gd",
		function()
			require("telescope.builtin").lsp_definitions(require("telescope.themes").get_cursor({
				jump_type = "vsplit",
				reuse_win = true,
			}))
		end,
		desc = "Go to declaration",
	},
	{
		"gI",
		function()
			require("telescope.builtin").lsp_implementations(require("telescope.themes").get_cursor({
				jump_type = "vsplit",
				reuse_win = true,
			}))
		end,
		desc = "Go to implementation",
	},
	{
		"gr",
		function()
			require("telescope.builtin").lsp_references(require("telescope.themes").get_cursor({
				jump_type = "vsplit",
			}))
		end,
		desc = "Go to references",
	},
}

return M
