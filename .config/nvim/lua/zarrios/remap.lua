local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)
vim.keymap.set("n", "-", vim.cmd.Ex, opts)

vim.keymap.set("i", "jj", "<Esc>", opts)
vim.keymap.set("i", "kj", "<Esc>", opts)

-- highlight last highlighted block again
vim.keymap.set("n", "gV", "`[v`]")

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- Swap lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Redraw, line [count] at center of window (default cursor line).
-- Put cursor at first non-blank in the line.
-- to know more ":h zz"
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "gd", "gdzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- disables hlsearch
vim.keymap.set("n", "<C-n>", "<cmd>nohl<CR>")

-- run tmux-sessionizer in nvim
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- make current opened buffer (file) executable
vim.keymap.set("n", "<leader>x", "<cmd>:!chmod u+x %<CR>")

-- go err handling snippet
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")


vim.keymap.set("n", "<leader>b", function()
    local command = vim.g.custom_build_command or ""
    -- Open a terminal and run the command
    vim.cmd("split | term " .. command)
    -- Resize the terminal window
    vim.cmd("resize 20")
end)

vim.keymap.set("n", "<leader>bs", function()
    -- prompt the user for compile command
    local cmd = vim.fn.input("compile command: ", vim.g.custom_build_command or "")

    ---@diagnostic disable-next-line: inject-field
    vim.g.custom_build_command = cmd
end)
