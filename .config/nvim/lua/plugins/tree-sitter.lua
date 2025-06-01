return {
    { "nvim-treesitter/nvim-treesitter" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter" 
        },
        opts = {
            auto_install = true
        }
    }
}
