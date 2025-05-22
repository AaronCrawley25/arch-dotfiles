return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
    },
    config = function ()
        require('neo-tree').setup({
            sources = {
                'filesystem',
                'document_symbols',
                'git_status'
            },
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },

            }
        })

        vim.keymap.set("n", "<leader>bf", function() vim.cmd [[Neotree toggle filesystem]] end, { desc = "Browse files (NeoTree)"})
        vim.keymap.set("n", "<leader>bs", function() vim.cmd [[Neotree toggle document_symbols]] end, { desc = "Browse document symbols (NeoTree)"})
        vim.keymap.set("n", "<leader>bg", function() vim.cmd [[Neotree toggle git_status]] end, { desc = "Browse git status (NeoTree)"})
        vim.keymap.set("n", "<leader>bb", function() vim.cmd [[Neotree close]] end, { desc = "Close (NeoTree)"})
    end
}
