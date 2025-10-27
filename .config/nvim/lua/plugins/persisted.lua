return {
	"olimorris/persisted.nvim",
	-- event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
	config = function()
		require("persisted").setup({
			autoload = true,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "PersistedTelescopeLoadPre",
			callback = function(session)
				-- Save the currently loaded session passing in the path to the current session
				require("persisted").save({ session = vim.g.persisted_loaded_session })

				-- Delete all of the open buffers
				vim.api.nvim_input("<ESC>:%bd!<CR>")
			end,
		})
	end,
}
