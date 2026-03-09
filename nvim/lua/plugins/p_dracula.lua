-------------
-- Dracula --
-------------

-- Installation
vim.pack.add({ { src = "https://github.com/Mofiqul/dracula.nvim" } })

-- Setup
local dracula = require("dracula")
dracula.setup({
  colors = {
    bg = "#000000",
    black = "#000000",
  },
  lualine_bg_color = "#000000",
})

vim.cmd("colorscheme dracula")
