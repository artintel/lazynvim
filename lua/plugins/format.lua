return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c   = { "clang-format" },
      cpp = { "clang-format" },
    },
    format_on_save = {
      lsp_fallback = false,
      timeout_ms   = 1000,
    },
  },
}
