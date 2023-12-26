vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.formatoptions = "tcj"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars = {
	tab = "󰄾  ",
	space = "·",
	trail = "-",
	eol = "",
	nbsp = "␣",
}
vim.opt.showbreak = "↪"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.spelllang = { "en", "ru" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = vim.fn.has("termguicolors") == 1
vim.opt.timeoutlen = 100
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.updatetime = 1000
vim.opt.wildmode = "longest:full,full"
vim.opt.winminwidth = 5
vim.opt.wrap = false
vim.opt.splitkeep = "cursor"

vim.opt.langmap =
	"ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\\"ZXCVBNM<>"
