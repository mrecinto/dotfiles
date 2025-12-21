return {
  -- Simple plugins
  'NMAC427/guess-indent.nvim',

  -- Modular plugins (comment to disable)
  require 'plugins.themes',
  require 'plugins.telescope',
  require 'plugins.neo_tree',
  require 'lsp.lsp',
  require 'plugins.typst_preview',
  require 'plugins.comment',

  require 'plugins.mdmath',
  require 'plugins.treesitter',

  -- for suggestions
  require 'plugins.blink_cmp',



  -- UI / theme switcher
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require 'ui.themery'
    end,
  },

  -- Optional plugins (easy toggles)
  -- require 'plugins.telescope',
  -- require 'plugins.lsp',
}

