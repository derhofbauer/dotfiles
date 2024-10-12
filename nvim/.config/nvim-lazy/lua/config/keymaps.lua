-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- lazygit (reverse root/cwd keymaps)
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")

vim.keymap.set("n", "<leader>gg", function()
  Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

vim.keymap.set("n", "<leader>gG", function()
  Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })

-- gen.nvim
vim.keymap.set("n", "<leader>G", ":Gen<CR>")
