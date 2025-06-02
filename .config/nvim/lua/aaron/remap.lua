-- Open NewRW
vim.keymap.set("n", "<leader>bd", vim.cmd.Ex)

-- Recentre cursor moving up and down
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

-- Move lines up and down with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
