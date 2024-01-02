return {
	"NvChad/nvim-colorizer.lua",
	buftypes = {
		"*",
		"!prompt",
		"!popup",
	},
	filetypes = {
		"*",
		css = { css = true, css_fn = true },
		html = { css = true, css_fn = true },
		javascriptreact = { css = true, css_fn = true },
		typescriptreact = { css = true, css_fn = true },
	},
	user_default_options = {
		mode = "virtualtext",
		tailwind = "lsp",
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		AARRGGBB = true,

		sass = { enable = true, parsers = { "css" } },
	},
}
