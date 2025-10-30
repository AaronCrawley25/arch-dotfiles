return {
	"nvim-lualine/lualine.nvim",
	-- The colorscheme needs to be a dependency to ensure auto theme works
	dependencies = { "nvim-tree/nvim-web-devicons", "sainnhe/sonokai" },
	config = function()
		local trans = require("lualine.themes.auto")
		trans.normal.c.bg = "none"
		trans.insert.c.bg = "none"
		trans.visual.c.bg = "none"
		trans.replace.c.bg = "none"
		trans.terminal.c.bg = "none"
		trans.command.c.bg = "none"

		require("lualine").setup({
			options = {
				theme = trans,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "branch", "diff", "diagnostics", "filename" },
				lualine_c = {
					"%=", --[[ add your center components here in place of this comment ]]
				},
				lualine_x = {},
				lualine_y = { "encoding", "fileformat", "filetype" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
			on_colors = function(colors)
				colors.bg_statusline = colors.none -- or "NONE"
			end,
		})
	end,
}
