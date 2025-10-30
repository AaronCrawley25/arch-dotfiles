-- Recentre cursor moving up and down
-- Also see cinnamon.nvim plugin config
vim.keymap.set("n", "G", "Gzz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- Move lines up and down with J and K in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader><space>", vim.cmd.noh, { desc = "Remove search highlights" })

-- Copy/Paste from system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>p", '"+p')

-- When copying in visual mode, move to the end where you started the selection
vim.keymap.set("v", "y", "ygvo<Esc>")

-- Don't overwrite register when pasting in visual mode
vim.keymap.set("v", "p", "P")
