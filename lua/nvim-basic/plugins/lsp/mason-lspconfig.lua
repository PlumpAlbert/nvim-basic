local function on_attach(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		local has_navic, navic = pcall(require, "nvim-navic")
		if has_navic then
			navic.attach(client, bufnr)
		end
	end

	local has_which_key, wkey = pcall(require, "which-key")
	if has_which_key then
		wkey.register({
			["<leader>l"] = { name = "+LSP" },
		})
	end

	local bind = vim.keymap.set

	---@param opts table
	local function get_opts(opts)
		opts = opts or {}
		return vim.tbl_extend("force", { buffer = bufnr }, opts)
	end

	bind("n", "K", function()
		local ufo_installed, ufo = pcall(require, "ufo")
		if ufo_installed then
			local winid = ufo.peekFoldedLinesUnderCursor()
			if winid then
				return
			end
		end

		vim.lsp.buf.hover()
	end, get_opts({ desc = "Symbol hover" }))

	bind(
		"i",
		"<C-k>",
		vim.lsp.buf.signature_help,
		get_opts({ desc = "Signature help" })
	)
	bind(
		"n",
		"<leader>ls",
		vim.lsp.buf.signature_help,
		get_opts({ desc = "Rename symbol" })
	)

	bind(
		"n",
		"gl",
		vim.diagnostic.open_float,
		get_opts({ desc = "Diagnostics (float)" })
	)

	bind(
		"n",
		"<leader>la",
		vim.lsp.buf.code_action,
		get_opts({ desc = "Code actions" })
	)

	bind(
		"n",
		"]d",
		vim.diagnostic.goto_next,
		get_opts({ desc = "Go to next diagnostic" })
	)
	bind(
		"n",
		"[d",
		vim.diagnostic.goto_prev,
		get_opts({ desc = "Go to previous diagnostic" })
	)

	bind(
		"n",
		"<leader>lr",
		vim.lsp.buf.rename,
		get_opts({ desc = "Rename symbol" })
	)

	bind("n", "<leader>ld", function()
		local installed, telescope = pcall(require, "telescope.builtin")
		if not installed then
			return vim.diagnostic.setloclist()
		end

		telescope.diagnostics(require("telescope.themes").get_dropdown())
	end, get_opts({ desc = "Rename symbol" }))
end

return {
	"williamboman/mason-lspconfig.nvim",
	event = { "BufRead", "BufNewFile" },
	dependencies = {
		"hrsh7th/nvim-cmp",
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local ensure_installed = { "lua_ls" }

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		require("mason-lspconfig").setup({
			ensure_installed = ensure_installed,
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = {
							Lua = {
								runtime = {
									path = vim.split(package.path, ";"),
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME .. "/lua",
									},
								},
							},
						},
					})
				end,
			},
		})
	end,
}
