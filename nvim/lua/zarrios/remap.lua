vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)
vim.keymap.set("n", "gV", "`[v`]")

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", opts)

vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", opts)


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


vim.keymap.set("n", "gd", "gdzz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>:!chmod +x %<CR>")
