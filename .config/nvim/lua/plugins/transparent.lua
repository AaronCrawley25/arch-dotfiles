return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			-- table: additional groups that should be cleared
			extra_groups = { "DressingWindow" },
			-- table: groups you don't want to clear
			exclude_groups = { "Telescope" },
			-- function: code to be executed after highlight groups are cleared
			-- Also the user event "TransparentClear" will be triggered
			on_clear = function() end,
		})
	end,
}
