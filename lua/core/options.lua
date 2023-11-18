local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
--	relativenumber = true,
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
vim.g.nord_italic   = false
vim.g.nord_bold     = false

vim.o.scrolloff = 7
vim.o.sidescrolloff = 7

vim.o.shell = "nu"
vim.o.shellcmdflag = "-c"
vim.o.shellquote = ""
vim.o.shellxquote = ""

-- vim.g.lsp_zero_ui_float_border = 'double'


local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
