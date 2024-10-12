return {
  "numToStr/FTerm.nvim",
  opts = {
    ---Filetype of the terminal buffer
    ---@type string
    ft = "FTerm",

    ---Neovim's native window border. See `:h nvim_open_win` for more configuration options.
    border = "single",

    ---Close the terminal as soon as shell/command exits.
    ---Disabling this will mimic the native terminal behaviour.
    ---@type boolean
    auto_close = true,

    ---Highlight group for the terminal. See `:h winhl`
    ---@type string
    hl = "Normal",

    ---Transparency of the floating window. See `:h winblend`
    ---@type integer
    blend = 0,

    ---Object containing the terminal window dimensions.
    ---The value for each field should be between `0` and `1`
    ---@type table<string,number>
    dimensions = {
      height = 0.8, -- Height of the terminal window
      width = 0.8, -- Width of the terminal window
      x = 0.5, -- X axis of the terminal window
      y = 0.5, -- Y axis of the terminal window
    },
  },
  keys = {
    { "<leader>ft", '<CMD>lua require("FTerm").toggle()<CR>', noremap = true },
  },
}
