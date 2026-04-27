return {
  "nvim-treesitter/nvim-treesitter",
  config = function(_, opts)
    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers")

    --- TypoScript parser
    parser_config.typoscript = {
      install_info = {
        url = "https://github.com/Teddytrombone/tree-sitter-typoscript",
        revision = "1811c767f3f72be669891b524a07c58b1eb0db87",
        -- optional entries:
        --branch = "develop", -- only needed if different from default branch
        --location = "parser", -- only needed if the parser is in subdirectory of a "monorepo"
        --generate = true, -- only needed if repo does not contain pre-generated `src/parser.c`
        --generate_from_json = false, -- only needed if repo does not contain `src/grammar.json` either
        --queries = "queries/neovim", -- also install queries from given directory,
      },
    }

    --- Laravel Blade parser
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        -- optional entries:
        branch = "main",
      },
      filetype = "blade",
    }
  end,
}
