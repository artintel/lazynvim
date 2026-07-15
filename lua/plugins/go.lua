return {

  -- add language parsers to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "gomod",
        "gowork",
      })
    end,
  },

  -- cmdline tools for LSP servers, DAP servers, formatters and linters
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "gopls",
        "goimports",
        "gofumpt",
        "golangci-lint",
        "golangci-lint-langserver", -- Wraps golangci-lint as a language server
        "delve",
        --"staticcheck",
        "gomodifytags",
        "impl",
      })
    end,
  },

  -- setup lspconfig servers
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- server cmdline will be automatically installed with mason and loaded with lspconfig
      ---@type lspconfig.options
      servers = {
        gopls = {
          gofumpt = true, -- formatter, default "goimports"
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
        },
        golangci_lint_ls = {}, -- linter
      },
      code_actions = { -- null-ls.nvim: builtins code_actions
        "gomodifytags",
        "impl",
      },
      dap = { -- nvim-dap: language specific extensions
        { "leoluz/nvim-dap-go" },
      },
      test = { -- neotest: language specific adapters
        "nvim-neotest/neotest-go",
        adapters = {
          ["neotest-go"] = {
            args = { "-count=1", "-timeout=60s", "-race", "-cover" },
          },
        },
      },
    },
  },

  -- setup code actions
  {
    "nvimtools/none-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
      })
    end,
  },

  -- setup neotest adapter
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/neotest-go",
    },
    opts = function(_, opts)
      table.insert(opts.adapters, function()
        return require("neotest-go")({
          args = { "-count=1", "-timeout=60s", "-race", "-cover" },
        })
      end)
    end,
  },
}
