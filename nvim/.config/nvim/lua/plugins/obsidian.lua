return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  opts = {
    legacy_commands = false,

    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
      {
        name = "work",
        path = "~/Documents/ucsd-notes",
      },
    },

    ui = {
      enable = false,
    },
  },
}

