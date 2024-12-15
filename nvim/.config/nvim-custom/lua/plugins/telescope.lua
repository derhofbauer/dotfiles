return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    --{ "<leader>/", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },

    -- find
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Telescope: Buffers" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Telescope: Files", remap = true },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Files" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Telescope: Commands" },
    { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Telescope: Registers" },
    { "<leader>fi", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope: In Buffer" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope: Help Tags" },
    { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Telescope: Resume" },
    { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Telescope: Quickfix" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Live Grep" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Telescope: Grep String" },

    --{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Telescope: Auto Commands" },
    --{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command History" },
    --{ "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    --{ "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    --{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Telescope: Highlight Groups" },
    --{ "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Telescope: Jumplist" },
    --{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Telescope: Key Maps" },
    --{ "<leader>sl", "<cmd>Telescope loclist<cr>", desc = "Telescope: Location List" },
    --{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Telescope: Man Pages" },
    --{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Telescope: Jump to Mark" },
    --{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Telescope:  Options" },
    --{ "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w"}), desc = "Word (Root Dir)" },
    --{ "<leader>sW", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
    --{ "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
    --{ "<leader>sW", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
    --{ "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with Preview" },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols({
          --symbols = LazyVim.config.get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          --symbols = LazyVim.config.get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
    {
      "<leader>en",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end,
      desc = "Telescope: config files (Edit Neovim)",
    },
    {
      "<leader>ep",
      function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end,
      desc = "Telescope: plugins (Edit Plugin)",
    },
  },
}
