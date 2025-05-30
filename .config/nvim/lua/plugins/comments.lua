return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function ()
            require("todo-comments").setup()

            vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope)
            vim.keymap.set("n", "<leader>bt", vim.cmd.TodoTrouble)
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        opts = {}
    }
}
