return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            require("todo-comments").setup()

            vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope, { desc = 'Todo Telescope'})
            vim.keymap.set("n", "<leader>bt", vim.cmd.TodoTrouble, { desc = 'Todo Menu'})
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        opts = {}
    }
}
