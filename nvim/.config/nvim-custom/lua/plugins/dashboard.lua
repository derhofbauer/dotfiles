return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    -- taken from http://patorjk.com/software/taag/#p=display&f=Ivrit&t=derNvim
    local logo = [[
      _           _   _       _           
   __| | ___ _ __| \ | |_   _(_)_ __ ___  
  / _` |/ _ \ '__|  \| \ \ / / | '_ ` _ \ 
 | (_| |  __/ |  | |\  |\ V /| | | | | | |
  \__,_|\___|_|  |_| \_| \_/ |_|_| |_| |_|
  ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "hyper",
      config = {
        header = vim.split(logo, "\n"),
      },
    }

    return opts
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
