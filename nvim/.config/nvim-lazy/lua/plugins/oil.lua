return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = false,
    columns = {
      "icon",
      --"permissions",
      --"size",
      --"mtime",
    },
    view_options = {
      show_hidden = true,
    },
  },
}
