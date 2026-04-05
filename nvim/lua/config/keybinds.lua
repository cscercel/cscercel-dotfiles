vim.g.mapleader = " "

-- Quicksave and quit
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")

-- Paste over selection without loosing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Apparently I need this
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Source file
vim.keymap.set("n", "<leader><leader>", ":so %<CR>")

-- The best thing ever
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
