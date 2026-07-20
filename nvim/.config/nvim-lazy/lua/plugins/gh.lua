return {
  "ldelossa/gh.nvim",
  dependencies = {
    {
      "ldelossa/litee.nvim",
      config = function()
        require("litee.lib").setup()
      end,
    },
  },
  config = function()
    require("litee.gh").setup()

    -- TODO: add bindings to which-key for easier help
    --       https://github.com/ldelossa/gh.nvim
  end,
}
