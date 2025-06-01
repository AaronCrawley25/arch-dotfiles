return {
    "declancm/cinnamon.nvim",
    config = function ()
        local cinnamon = require("cinnamon")

        cinnamon.setup({
            keymaps = {
                basic = true,
                extra = false,
            }
        })

        -- Centered scrolling:
        vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
        vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)

        vim.keymap.set("n", "zz", function() cinnamon.scroll("zz") end)
        vim.keymap.set("n", "zt", function() cinnamon.scroll("zt") end)
        vim.keymap.set("n", "zb", function() cinnamon.scroll("zb") end)
    end
}
