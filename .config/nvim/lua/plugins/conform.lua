return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			typescriptreact = { "prettier" },
			typescript = { "prettier" },
			lua = { "stylua" },
			yaml = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
