return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason.nvim"
    },
    config = function()
        require('mason').setup({})
        require('mason-lspconfig').setup({
            -- Replace the language servers listed here 
            -- with the ones you want to install
            ensure_installed = {'lua_ls'},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
        })
    end
}
