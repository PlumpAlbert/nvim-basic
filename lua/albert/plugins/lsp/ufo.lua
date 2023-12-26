return {
	"kevinhwang91/nvim-ufo",
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"kevinhwang91/promise-async",
		"anuvyklack/pretty-fold.nvim"
	},
	init = function()
		vim.o.foldcolumn = '1'
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require("ufo").setup({
			open_fold_hl_timeout = 150,
			close_fold_kinds = {'imports', 'comment'},
		})

		require("pretty-fold").setup({
			sections = {
				left = { 'content', },
				right = {
					' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
					function(config) return config.fill_char:rep(3) end
				}
			},
			fill_char = '━',
			remove_fold_markers = true,
			keep_indentation = true,
			process_comment_signs = 'spaces',
			comment_signs = {
				"/**",
				{ '--[[', ']]--', },
				'//',
			},
			stop_words = {
				'@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
			},
			add_close_pattern = true, -- true, 'last_line' or false
			matchup_patterns = {
				{  '{', '}' },
				{ '%(', ')' }, -- % to escape lua pattern char
				{ '%[', ']' }, -- % to escape lua pattern char
			},
			ft_ignore = { 'neorg' },
		})
	end
}
