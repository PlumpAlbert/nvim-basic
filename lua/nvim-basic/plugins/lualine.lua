local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		require("lualine").setup(vim.tbl_deep_extend("force", {
			icons_enabled = false,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "neo-tree" },
				winbar = { "neo-tree" },
			},
			globalstatus = true,
			sections = {
				lualine_a = { "branch" },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = {
					function()
						local has, lint = pcall(require, "lint")
						if not has then
							return
						end
						local linters = lint.get_running()
						if #linters == 0 then
							return "󰦕"
						end
						return "󱉶 " .. table.concat(linters, ", ")
					end,
				},
				lualine_x = {
					{
						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.bo.filetype
							local clients = vim.lsp.get_clients({
								bufnr = vim.fn.bufnr("%"),
							})
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if
									filetypes
									and vim.fn.index(filetypes, buf_ft)
										~= -1
								then
									return client.name
								end
							end
							return msg
						end,
						icon = "LSP:",
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		}, opts or {}))
	end,
}

return M
