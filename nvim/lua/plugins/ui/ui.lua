return {
  {
    "zaldih/themery.nvim",
    lazy = false, -- MUST load on startup for persistence
    config = function()
      require("ui.themery")
    end,
  },

  -- colorschemes (lazy-load safe)
  { "folke/tokyonight.nvim", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
}

