return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  opts = {
    -- enable whatever features you want:
    ui = {
      input = false,
      select = false,
      notifications = false,
      popup = false,
      cmdline = false, -- ⭐ THIS is the floating command-line popup
      palette = false, -- fuzzy menu for ex-commands
    },
    picker = {
      enabled = true,
    },
  },
}
