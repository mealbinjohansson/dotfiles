vim.pack.add({ "https://github.com/scottmckendry/cyberdream.nvim.git" })

require("cyberdream").setup({
	transparent = true,
	italic_comments = true,
	terminal_colors = true,
	cache = false,
	colors = {
		bg = "#000000",
	},
})
vim.cmd("colorscheme cyberdream")
