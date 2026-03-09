-------------
-- Dracula --
-------------

-- Installation
vim.pack.add({ { src = "https://github.com/Mofiqul/dracula.nvim" } })

-- Setup
vim.cmd("colorscheme dracula")
vim.cmd("hi Normal guibg=#000000")

local dracula = require("dracula")
dracula.setup({
  colors = {
    bg = "#000000",
    black = "#000000",
  },
  lualine_bg_color = "#000000",
})
