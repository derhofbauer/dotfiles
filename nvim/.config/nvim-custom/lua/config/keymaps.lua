-- Quit all buffers (aka quit neovim)
vim.api.nvim_set_keymap("n", "<leader>qq", "<cmd>qa<cr>", { noremap = true, desc = "Quit all buffers" })

-- Buffer keymaps
vim.api.nvim_set_keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.api.nvim_set_keymap("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Exceute current file
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- Exceutre selection
vim.keymap.set("v", "<space>x", ":lua<CR>")
