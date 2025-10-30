return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	config = function()
		require("oil").setup({
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
			},
			git = {
				mv = function(src, dest)
					return true
				end,
				rm = function(path)
					return true
				end,
			},
			skip_confirm_for_simple_edits = true,
		})
		vim.keymap.set("n", "<leader>bf", "<CMD>Oil<CR>", { desc = "Browse files (oil)" })
	end,
}
