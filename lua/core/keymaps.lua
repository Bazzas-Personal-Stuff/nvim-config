local map = require("helpers.keys").map

map("n", "<leader>E", "<cmd>e .<cr>", "Open explorer")

map("i", "jk", "<esc>", "Fast exit from insert mode")

map("v", "p", '"_dP', "Visual paste without yanking")

-- ----- Defined in LSP on buffer attach
-- map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")
-- map('n', 'gj', vim.diagnostic.goto_next, "Go to next diagnostic")
-- map('n', 'gk', vim.diagnostic.goto_prev, "Go to previous diagnostic")


-- Navigate with shift-hjkl
map("n", "<S-k>", "<Nop>", "Nop")
map("n", "<S-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<S-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<S-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<S-l>", "<C-w><C-l>", " windows to the right")

-- Move with alt-hjkl
map("n", "<M-h>", "<C-w><S-h>", "Move window to the left")
map("n", "<M-j>", "<C-w><S-j>", "Move window down")
map("n", "<M-k>", "<C-w><S-k>", "Move window up")
map("n", "<M-l>", "<C-w><S-l>", "Move window to the right")

-- Split windows with ctrl-hjkl
map("n", "<C-h>", "<C-w>v", "Split window to the left")
map("n", "<C-j>", "<C-w>s<C-w><C-j>", "Split window downwards")
map("n", "<C-k>", "<C-w>s", "Split window upward")
map("n", "<C-l>", "<C-w>v<C-w><C-l>", "Split window to the right")

-- Easy big jumps
map("n", "<S-Left>", "^", "Go to beginning of line")
map("n", "<S-Down>", "}", "Go to lower bracket")
map("n", "<S-Up>", "{", "Go to higher bracket")
map("n", "<S-Right>", "$", "Go to end of line")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Full word deletion
map("i", "<C-BS>", "<C-W>", "Delete word backwards")
map("i", "<C-DEL>", "<C-o>de", "Delete word forwards")
map("n", "<C-BS>", "<C-W>", "Delete word backwards")
map("n", "<C-DEL>", "<C-o>de", "Delete word forwards")

map("n", "<leader>q", "<Cmd>bprevious <bar> bdelete #<CR>", "Close buffer")
map("n", "<leader>Q", "<Cmd>bd<CR>", "Close split and buffer")

map("n", "<leader>/", "<Cmd>noh<CR>", "Clear search highlighting")

map("n", "<leader>t", "<Cmd>terminal<CR>", "Open terminal")
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")
