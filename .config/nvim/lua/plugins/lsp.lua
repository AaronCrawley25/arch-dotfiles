return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        -- Reserve a space in the gutter
        -- This will avoid an annoying layout shift in the screen
        vim.opt.signcolumn = 'yes'

        -- Add cmp_nvim_lsp capabilities settings to lspconfig
        -- This should be executed before you configure any language server
        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- This is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {buffer = event.buf}

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        local cmp = require('cmp')
        local luasnip = require('luasnip')

        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            sources = {
                {name = 'nvim_lsp'},
            },
            snippet = {
                expand = function(args)
                    -- You need Neovim v0.10 to use vim.snippet
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item({behavior = 'select'})
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, {'i', 's'}),

                -- Super shift tab
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({behavior = 'select'})
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {'i', 's'}),
                ['<Esc>'] = function(fallback)
                    if cmp.visible() then
                        cmp.close()
                    else
                        fallback()
                    end
                end
            }),
        })

        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '',
                    [vim.diagnostic.severity.WARN] = '',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                },
            },
        })
    end
 }
