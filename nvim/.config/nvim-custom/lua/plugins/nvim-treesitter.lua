return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "blade",
        "css",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "graphql",
        "html",
        "javascript",
        "json",
        "lua",
        "make",
        "markdown",
        "mermaid",
        "nginx",
        "nginx",
        "passwd",
        "php",
        "phpdoc",
        "prolog",
        "query", -- tree-sitter query syntax
        "robots",
        "scss",
        "sql",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "typoscript",
        "vue",
        "xml",
        "yaml",
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      highlight = { enabled = true },
      indent = { enabled = true },
      auto_install = true,
      sync_install = false,
      modules = {},
      ignore_install = {},
    })
  end,
  opts = function()
    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    --- LESS parser
    parser_config.less = {
      install_info = {
        url = "https://github.com/jimliang/tree-sitter-less",
        files = { "src/parser.c", "src/scanner.c" },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = "less",
    }

    --- nginx parser
    parser_config.nginx = {
      install_info = {
        url = "https://gitlab.com/joncoole/tree-sitter-nginx",
        files = { "src/parser.c" },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
    }

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
  keys = {
    { "<leader>tsp", "<cmd>InspectTree<cr>", noremap = true },
  },
}
