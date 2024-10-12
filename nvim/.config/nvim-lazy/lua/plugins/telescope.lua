return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader><space>", LazyVim.pick("files", { cwd = false }), desc = "Find Files (cwd)" },
    { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", LazyVim.pick("files", { cwd = false }), desc = "Find Files (cwd)" },

    { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
    { "<leader>sg", LazyVim.pick("live_grep", { cwd = false }), desc = "Grep (cwd)" },

    { "<leader>sW", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
    { "<leader>sw", LazyVim.pick("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
    { "<leader>sW", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (root dir)" },
    { "<leader>sw", LazyVim.pick("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
  },
}
