return {
    "declancm/cinnamon.nvim",
    config = function ()
        local cinnamon = require("cinnamon")

        cinnamon.setup({
            -- Disable these and only enable explictly liked ones
            keymaps = {
                basic = false,
                extra = false,
            }
        })

        -- Centered scrolling:
        vim.keymap.set("n", "<C-U>", function() cinnamon.scroll("<C-U>zz") end)
        vim.keymap.set("n", "<C-D>", function() cinnamon.scroll("<C-D>zz") end)

        vim.keymap.set("n", "zz", function() cinnamon.scroll("zz") end)
        vim.keymap.set("n", "zt", function() cinnamon.scroll("zt") end)
        vim.keymap.set("n", "zb", function() cinnamon.scroll("zb") end)

        vim.keymap.set("n", "}", function() cinnamon.scroll("}zz") end)
        vim.keymap.set("n", "{", function() cinnamon.scroll("{zz") end)
    end
}
