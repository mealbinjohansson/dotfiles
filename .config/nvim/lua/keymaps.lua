vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Utils
map("n", "<leader>r", ":source %<CR>", { desc = "Source current file" })

-- Navigation
map("n", "<leader>ex", ":Explore<CR>", { desc = "Open file explorer" })
map("n", "<leader>ec", ":e ~/.config/nvim/<CR>", { desc = "Edit neovim config" })

-- LSP
map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format current buffer" })

-- Picker
map("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Find files in current directory" })
map("n", "<leader>fg", function() require("fzf-lua").live_grep() end, { desc = "Grep in files in current directory" })
map("n", "<leader>fr", function() require("fzf-lua").git_files() end, { desc = "Find git files in current repo" })
map("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "Search for neovim help pages" })
map("n", "<leader>lr", function() require("fzf-lua").lsp_references() end, { desc = "Search LSP references" })

-- Remove arrow keymaps in normal and insert mode
map("", "<up>", "<nop>", { noremap = true })
map("", "<down>", "<nop>", { noremap = true })
map("", "<left>", "<nop>", { noremap = true })
map("", "<right>", "<nop>", { noremap = true })
map("i", "<up>", "<nop>", { noremap = true })
map("i", "<down>", "<nop>", { noremap = true })
map("i", "<left>", "<nop>", { noremap = true })
map("i", "<right>", "<nop>", { noremap = true })
