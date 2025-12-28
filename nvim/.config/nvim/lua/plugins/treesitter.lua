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
      "lua",
      "vim",
      "bash",
      "markdown",
      "typst", -- ← THIS is #3
    },
  }
}

