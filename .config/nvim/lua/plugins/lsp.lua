return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		-- Reserve a space in the gutter
		-- This will avoid an annoying layout shift in the screen
		vim.opt.signcolumn = "yes"

		-- Add cmp_nvim_lsp capabilities settings to lspconfig
		-- This should be executed before you configure any language server
		local lspconfig_defaults = require("lspconfig").util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- This is where you enable features that only work
		-- if there is a language server active in the file
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<A-CR>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		local cmp_kinds = {
			Text = " Text ",
			Method = " Method ",
			Function = " Function ",
			Constructor = " Constructor ",
			Field = " Field ",
			Variable = " Variable ",
			Class = " Class ",
			Interface = " Interface ",
			Module = " Module ",
			Property = " Property ",
			Unit = " Unit ",
			Value = " Value ",
			Enum = " Enum ",
			Keyword = " Keyword ",
			Snippet = " Snippet ",
			Color = " Color ",
			File = " File ",
			Reference = " Reference ",
			Folder = " Folder ",
			EnumMember = " EnumMember ",
			Constant = " Constant ",
			Struct = " Struct ",
			Event = " Event ",
			Operator = " Operator ",
			TypeParameter = " TypeParameter ",
		}

		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			},
			snippet = {
				expand = function(args)
					-- You need Neovim v0.10 to use vim.snippet
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "kind", "abbr" },
				format = function(_, item)
					item.kind = cmp_kinds[item.kind] or ""
					return item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					local col = vim.fn.col(".") - 1

					-- Select next only if visible and hasn't wrapped off end of list
					if cmp.visible() and cmp.get_selected_entry() then
						cmp.select_next_item({ behavior = "select" })
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						-- If its still visible we want to close it
						if cmp.visible() then
							cmp.close()
						end

						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = "select" })
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Esc>"] = function(fallback)
					if cmp.visible() then
						cmp.close()
					else
						fallback()
					end
				end,

				-- Open Autocomplete menu
				["<C-Space>"] = cmp.mapping.complete(),
			}),
		})

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.HINT] = "⚑",
					[vim.diagnostic.severity.INFO] = "»",
				},
			},
		})

		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
