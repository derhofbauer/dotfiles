-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.colorcolumn = "80,120"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.g.lazyvim_picker = "telescope"

vim.treesitter.language.register("blade", "blade")
vim.treesitter.language.register("typoscript", "typoscript")

vim.filetype.add({
  extension = {
    typoscript = "typoscript",
    tsconfig = "typoscript",
    ["blade.php"] = "blade",
  },
  filename = {
    ["setup.txt"] = "typoscript",
    ["constants.txt"] = "typoscript",
  },
})
