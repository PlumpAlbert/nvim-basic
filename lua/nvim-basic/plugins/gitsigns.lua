local function on_attach(bufnr)
	local has_which_key, wkey = pcall(require, "which-key")

	if has_which_key then
		wkey.register({
			["<leader>g"] = { name = "+GIT" },
		})
	end

	local gs = package.loaded.gitsigns

	local function opts(o)
		return vim.tbl_extend("force", { buffer = bufnr }, o or {})
	end

	--#region navigate
	vim.keymap.set("n", "]c", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end, opts({ expr = true, desc = "Go to next hunk" }))

	vim.keymap.set("n", "[c", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end, opts({ expr = true, desc = "Go to previous hunk" }))
	--#endregion

	--#region staging
	vim.keymap.set(
		"n",
		"<leader>gs",
		gs.stage_hunk,
		opts({ desc = "Stage hunk" })
	)

	vim.keymap.set("v", "<leader>gs", function()
		gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, opts({ desc = "Stage hunk" }))

	vim.keymap.set(
		"n",
		"<leader>gS",
		gs.stage_buffer,
		opts({ desc = "Stage buffer" })
	)
	--#endregion

	--#region reset
	vim.keymap.set(
		"n",
		"<leader>gr",
		gs.reset_hunk,
		opts({ desc = "Reset hunk" })
	)

	vim.keymap.set("v", "<leader>gr", function()
		gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end, opts({ desc = "Reset hunk" }))

	vim.keymap.set(
		"n",
		"<leader>gR",
		gs.reset_buffer,
		opts({ desc = "Reset buffer" })
	)
	--#endregion

	--#region preview
	vim.keymap.set("n", "<leader>gp", function()
		gs.preview_hunk()
	end, opts({ desc = "Preview hunk" }))

	vim.keymap.set("n", "<leader>gd", function()
		gs.diffthis()
	end, opts({ desc = "Diff this" }))

	vim.keymap.set("n", "<leader>gb", function()
		gs.blame_line({ full = true, ignore_whitespace = true })
	end, opts({ desc = "Blame line" }))
	--#endregion
end

return {
	"lewis6991/gitsigns.nvim",
	config = function(_, opts)
		require("gitsigns").setup(vim.tbl_deep_extend("force", {
			on_attach = on_attach,
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = false,
			numhl = true,
			linehl = false,
			word_diff = false,
			watch_gitdir = {
				follow_files = true,
			},
			attach_to_untracked = false,
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol",
				delay = 150,
				ignore_whitespace = false,
				virt_text_priority = 0,
			},
			current_line_blame_formatter = "[<author>] <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil,
			max_file_length = 40000,
			preview_config = {
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 1,
				col = 1,
			},
			yadm = { enable = false },
		}, opts or {}))
	end,
}
