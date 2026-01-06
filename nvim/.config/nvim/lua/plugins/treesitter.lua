return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  indent = { enable = true; },
  -- opts = {
  --   highlight = {
  --     enable = true,
  --   },
  -- },
    opts = {
      ensure_installed = {
      "c",
      "cpp",
      "lua",
      "vim",
      "bash",
      "markdown",
      "markdown_inline",
      "latex",
      "typst",
    }
  }
}
