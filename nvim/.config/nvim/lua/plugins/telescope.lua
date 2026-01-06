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
  -- Find files (LOCAL: current file's directory)
  {
    "<leader>fs",
    function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.expand("%:p:h"),
      })
    end,
    desc = "Find files (current directory)",
  },

  -- Grep text (GLOBAL: entire cwd / vault)
  {
    "<leader>fg",
    function()
      require("telescope.builtin").live_grep()
    end,
    desc = "Grep text (global)",
  },

  -- Optional but useful
  {
    "<leader>fo",
    function() require("telescope.builtin").oldfiles() end,
    desc = "Recent files",
  },
  {
    "<leader>fb",
    function() require("telescope.builtin").buffers() end,
    desc = "Buffers",
  },
  {
    "<leader>fh",
    function() require("telescope.builtin").help_tags() end,
    desc = "Help",
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

