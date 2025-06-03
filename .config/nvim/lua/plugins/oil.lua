return {
    'stevearc/oil.nvim',
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function ()
        require("oil").setup({
            view_options = {
                show_hidden = true,
            }
        })
        vim.keymap.set("n", "<leader>bf", "<CMD>Oil<CR>", { desc = "Browse files (oil)" })
    end
}
