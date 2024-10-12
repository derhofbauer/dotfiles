return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },

    -- Autoformatting
    "stevearc/conform.nvim",

    -- Schema information
    "b0o/SchemaStore.nvim",
  },
  opts = {
    ensure_installed = {
      "bash-debug-adapter",
      "bash-language-server",
      "beautysh",
      "blade-formatter",
      "buf",
      "buf-language-server",
      "cmake-language-server",
      "cmakelang",
      "css-lsp",
      "delve",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "dot-language-server",
      "eslint-lsp",
      "eslint_d",
      "ts_ls",
      "gofumpt",
      "goimports-reviser",
      "gomodifytags",
      "gopls",
      "gotests",
      "graphql-language-service-cli",
      "hadolint",
      "html-lsp",
      "htmlhint",
      "impl",
      "intelephense",
      "js-debug-adapter",
      "json-lsp",
      "jsonlint",
      "lemminx",
      "lua-language-server",
      "luacheck",
      "markdownlint",
      "marksman",
      "markuplint",
      "mdx-analyzer",
      "nginx-language-server",
      "php-debug-adapter",
      "phpactor",
      "phpmd",
      "phpstan",
      "pint",
      "prettier",
      "protolint",
      "rustywind",
      "shellcheck",
      "sql-formatter",
      "sqlfluff",
      "stylelint",
      "stylua",
      "systemdlint",
      "tailwindcss-language-server",
      "taplo",
      "templ",
      "tlint",
      "typescript-language-server",
      "vacuum",
      "vue-language-server",
      "xmlformatter",
      "yaml-language-server",
      "yamllint",
      -- Prolog Language Server: https://github.com/jamesnvc/lsp_server
      --"php-cs-fixer",
      --"phpcs",
      --"pretty-php",
    },
  },
  config = function(_, opts)
    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    local lspconfig = require("lspconfig")

    local servers = {
      bashls = true,
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      lua_ls = {
        server_capabilities = {
          semanticTokensProvider = vim.NIL,
        },
      },
      intelephense = true,
      ts_ls = {
        server_capabilities = {
          documentFormattingProvider = false,
        },
      },
      jsonls = {
        server_capabilities = {
          documentFormattingProvider = false,
        },
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      cssls = {
        server_capabilities = {
          documentFormattingProvider = false,
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            -- schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                [[class: "([^"]*)]],
              },
            },
          },
        },
      },
    }

    local servers_to_install = vim.tbl_filter(function(key)
      local t = servers[key]

      if type(t) == "table" then
        return not t.manual_install
      else
        return t
      end
    end, vim.tbl_keys(servers))

    require("mason").setup()

    vim.list_extend(opts.ensure_installed, servers_to_install)

    require("mason-tool-installer").setup({
      ensure_installed = opts.ensure_installed,
    })

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end
      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities,
      }, config)

      lspconfig[name].setup(config)
    end

    local disabled_semantic_tokens = {
      lua = true,
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid lsp client")

        local settings = servers[client.name]
        if type(settings) ~= "table" then
          settings = {}
        end

        local builtin = require("telescope.builtin")

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

        -- KEYMAPS
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
        vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
        vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

        vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
        vim.keymap.set("n", "<space>wd", builtin.lsp_document_symbols, { buffer = 0 })

        -- Disabled semantic tokens
        local filetype = vim.bo[bufnr].filetype
        if disabled_semantic_tokens[filetype] then
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- Override server capabilities
        if settings.server_capabilities then
          for k, v in pairs(settings.server_capabilities) do
            if f == vim.NIL then
              ---@diagnostics disable-next-line: cast-local-type
              v = nil
            end

            client.server_capabilities[k] = v
          end
        end
      end,
    })

    -- Autoformatting setup
    local conform = require("conform")
    conform.setup({
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        blade = { "blade-formatter" },
        sh = { "shfmt" },
        javascript = { "pretterd", "prettier", stop_after_first = true },
      },
      formatters = {
        injected = { options = { ignore_errors = false } },
      },
    })
  end,
}
