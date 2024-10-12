-- Relative line numbers
vim.wo.relativenumber = true

-- Visual rulers
vim.opt.colorcolumn = "80,120"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Define custom filetypes
vim.filetype.add({
  extension = {
    typoscript = "typoscript",
    tsconfig = "typoscript",
  },
  filename = {
    ["setup.txt"] = "typoscript",
    ["constants.txt"] = "typoscript",
  },
  pattern = {
    ["*blade.php"] = "blade",
  },
})
