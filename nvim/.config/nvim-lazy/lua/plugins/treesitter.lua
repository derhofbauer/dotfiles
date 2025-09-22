return {
  "nvim-treesitter/nvim-treesitter",
  ---@param opts TSConfig
  config = function(_, opts)
    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers")

    --- TypoScript parser
    parser_config.typoscript = {
      install_info = {
        url = "https://github.com/Teddytrombone/tree-sitter-typoscript",
        files = { "src/parser.c" },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "typoscript",
    }

    --- Laravel Blade parser
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
