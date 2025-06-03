return {
    'tpope/vim-fugitive',
    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        -- Push and Pull
        vim.keymap.set("n", "<leader>gj", "<cmd>G pull<CR>")
        vim.keymap.set("n", "<leader>gk", "<cmd>G push<CR>")

        -- Commit
        vim.keymap.set("n", "<leader>gc", "<cmd>G commit<CR>")

        -- Resolving Merge Conflicts
        vim.keymap.set("n", "<leader>ggf", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "<leader>ggj", "<cmd>diffget //3<CR>")

        -- Blame
        vim.keymap.set("n", "<leader>gb", "<cmd>G blame<CR>")

        -- Log
        vim.keymap.set("n", "<leader>gl", "<cmd>G log<CR>")
    end
}
