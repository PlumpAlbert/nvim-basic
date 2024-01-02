# Neovim configuration
## Basic

This is a general-purpose configuration of NeoVim.
It setups core functionality for development in NeoVim.

## Usage

To extend configuration do the following:

1. Create `init.lua` file inside your NeoVim configuration folder (defaults to `~/.config/nvim`):
```bash
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.lua
```

2. Install `lazy.nvim` and add this repo's plugins to your config:
```lua
-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end vim.opt.rtp:prepend(lazypath)

-- call `setup` function of basic repo
local installed, basic = pcall(require, "nvim-basic")
if installed then
	basic.setup()
end

require("lazy").setup({
	spec = {
		-- added basic repo config
		{ "plumpalbert/nvim-basic", import = "nvim-basic.plugins" },
		{ import = "custom-config-directory" },
	},
	lockfile = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json",
	install = { colorscheme = { "onedark", "habamax" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
			},
		},
	},
})
```

3. Create directory with your plugins and extend existing configuration.
In this example it will be in `~/.config/nvim/lua/custom-config-directory`.
