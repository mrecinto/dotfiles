return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = '  ',
        selection_caret = ' ',
        path_display = { 'smart' },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
        {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable('make') == 1,
    },

      },
    })
  end,
}

