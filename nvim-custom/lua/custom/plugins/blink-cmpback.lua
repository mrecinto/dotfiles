return {
  'saghen/blink.cmp',
  version = '*',
  event = 'InsertEnter',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'onsails/lspkind.nvim',
  },

  opts = {
    -- Disable auto-completion completely
    completion = {
      enabled = false, -- ← DISABLES completion popup
      menu = {
        enabled = false, -- ← Hide the popup menu UI
      },
      ghost_text = {
        enabled = false, -- optional
      },
      documentation = {
        window = {
          border = 'rounded',
        },
      },
    },

    keymap = { preset = 'default' },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
    },

    signature = {
      enabled = false, -- optional: disable signature popups
    },
  },
}
