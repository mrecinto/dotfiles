return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  keys = {
    -- Kickstart-style (s = search)
    {
      "<leader>sf",
      function() require("telescope.builtin").find_files() end,
      desc = "Search files",
    },
    {
      "<leader>sg",
      function() require("telescope.builtin").live_grep() end,
      desc = "Search grep",
    },
    {
      "<leader>sb",
      function() require("telescope.builtin").buffers() end,
      desc = "Search buffers",
    },
    {
      "<leader>sh",
      function() require("telescope.builtin").help_tags() end,
      desc = "Search help",
    },

    -- Speed-style (f = find)
    {
      "<leader>ff",
      function() require("telescope.builtin").find_files() end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function() require("telescope.builtin").live_grep() end,
      desc = "Find text (grep)",
    },

    -- QoL
    {
      "<leader>fr",
      function() require("telescope.builtin").oldfiles() end,
      desc = "Recent files",
    },
    {
      "<leader>fl",
      function() require("telescope.builtin").resume() end,
      desc = "Resume Telescope",
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top" },
        },
      },
    })

    -- Load fzf if available
    pcall(telescope.load_extension, "fzf")
  end,
}

