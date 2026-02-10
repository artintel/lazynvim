-- 禁用 Mason 对 clangd 的安装/管理，改用系统已装版本
return {
  -- 1. 告诉 mason-lspconfig：不要自动装 clangd
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {}, -- 留空即可，或只写其它语言
    },
  },

  -- 2. 告诉 lspconfig：clangd 我自己提供
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          mason = false,
          -- keys = {
          --   {
          --     "K",
          --     function()
          --       vim.lsp.buf.hover()
          --     end,
          --     desc = "LSP Hover / Macro expand",
          --   },
          -- },
          -- init_options = {
          --   clangd = {
          --     fallbackFlags = { "-std=c11" },
          --   },
          -- },
        },
      },
    },
  },
}
