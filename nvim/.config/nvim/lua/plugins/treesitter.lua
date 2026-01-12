return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    highlight = {
      enable = true,   -- REQUIRED for injections
    },
    indent = {
      enable = true,
    },
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
      "matlab",        -- IMPORTANT if you want MATLAB LSP in code blocks
    },
  },
}

