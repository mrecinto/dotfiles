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
      -- ✅ RELATIVE NUMBER HANDLER
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
          end,
        },
      },

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

        commands = {
          open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()

            if path:match('%.pdf$') then
              vim.fn.jobstart({ 'zathura', path }, { detach = true })
            else
              require('neo-tree.sources.filesystem.commands').open(state)
            end
          end,
        },
      },

      window = {
        position = 'float',
        -- position = 'left',
        width = 30,

        -- optional: keep these for consistency
        number = true,
        relativenumber = true,

        mappings = {
          ['<space>'] = 'none',
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

