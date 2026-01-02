return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",       -- optional: git status
      "nvim-tree/nvim-web-devicons",   -- optional: file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- put barbar options here
      -- animation = true,
      -- insert_at_start = true,
    },
    version = "^1.0.0", -- only update within 1.x
  },
}

