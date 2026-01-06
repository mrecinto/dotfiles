-- return {
--   "obsidian-nvim/obsidian.nvim",
--   version = "*",
--   ft = "markdown",
--   opts = {
--     legacy_commands = false,
--
--     workspaces = {
--       {
--         name = "personal",
--         path = "~/vaults/personal",
--       },
--       {
--         name = "work",
--         path = "~/Documents/ucsd-notes",
--       },
--     },
--
--     ui = {
--       enable = false,
--     },
--   },
-- }
return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    -- =========================
    -- New API (same as the guy)
    -- =========================
    legacy_commands = false,

    -- =========================
    -- Workspaces (YOUR VAULTS)
    -- =========================
    workspaces = {
      {
        name = "personal",
        path = vim.fn.expand("~/Documents/personal"),
      },
      {
        name = "school",
        path = vim.fn.expand("~/Documents/ucsd-notes"),
      },
    },
note_id_func = function(title)
  return title:lower()
end,

    -- =========================
    -- Inbox-first capture
    -- =========================
    -- notes_subdir = "01 - inbox",
    -- new_notes_location = "notes_subdir",

    -- =========================
    -- Frontmatter (new API)
    -- =========================
    frontmatter = {
      enabled = false,
    },

    -- =========================
    -- Templates
    -- =========================
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },


    -- =========================
    -- Completion
    -- =========================
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    -- =========================
    -- UI (disable obsidian UI, use markview)
    -- =========================
    -- ui = {
    --   bullets = {},
    -- },
    ui={
      enable = false
    },
  },
}

