vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Change Options for Specific Filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,yaml",
	command = "setlocal shiftwidth=2 tabstop=2",
})

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 10

vim.diagnostic.config({ virtual_text = true })

vim.g.markdown_fenced_languages = {
	"yaml",
	"sh",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "text,markdown",
	command = "setlocal textwidth=80",
})
