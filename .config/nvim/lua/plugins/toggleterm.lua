return {
    'akinsho/toggleterm.nvim',
    config = function ()
        require('toggleterm').setup({
            size = 20,
            shade_terminals = false,
            start_in_insert = false,
        })

        vim.keymap.set("n", "<C-`>", "<CMD>ToggleTerm<CR>", { desc = "Toggle Terminal" })
    end
}
