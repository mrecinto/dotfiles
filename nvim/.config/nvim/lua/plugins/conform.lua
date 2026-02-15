return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = false,
    },
    formatters = {
      typstfmt = {
        command = "typstfmt",
        stdin = true,
        allow_empty = true, -- THIS FIXES IT
      },
    },
    formatters_by_ft = {
      typst = { "typstfmt" },
    },
  },
}
