local M = {}

M.setup = function()
	require("nvim-basic.options")
	vim.cmd.colorscheme("onedark")
end

return M
