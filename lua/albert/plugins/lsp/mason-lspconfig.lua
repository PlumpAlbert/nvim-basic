return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = true,
	opts = function()
		local lspconfig = require("lspconfig")
		local ensure_installed = { "lua_ls" }

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		return {
			ensure_installed = ensure_installed,
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "LuaJIT" },
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					})
				end,
			},
		}
	end,
}
