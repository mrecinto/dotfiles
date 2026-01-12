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
  legacy_commands = false,

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

  follow_url_func = function(url)
    vim.fn.jobstart({ "xdg-open", url }, { detach = true })
  end,

  follow_img_func = function(img)
    vim.fn.jobstart({ "xdg-open", img }, { detach = true })
  end,

  frontmatter = {
    enabled = false,
  },

  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },

  completion = {
    nvim_cmp = false,
    min_chars = 2,
  },

  ui = {
    enable = false,
  },
}
}

