return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      popup_border_style = 'rounded',

      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = 'open_default',
        use_libuv_file_watcher = true,

        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

      window = {
        position = 'float',
        width = 30,
        mappings = {
          ['<space>'] = 'none',     -- avoid leader conflicts
          ['o'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node',
          ['<CR>'] = 'open',
          ['S'] = 'open_split',
          ['v'] = 'open_vsplit',
          ['q'] = 'close_window',
        },
      },

      default_component_configs = {
        indent = { with_markers = true },
        icon = {
          folder_closed = '',
          folder_open   = '',
          folder_empty  = '',
          default       = '',
        },
      },
    })
  end,
}

