require "nvchad.options"

vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("Filetype", {
  command = "set formatoptions-=cro",
})

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
