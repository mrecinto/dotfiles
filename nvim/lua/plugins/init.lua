return {
  -- Simple plugins
  'NMAC427/guess-indent.nvim',

  -- Modular plugins (comment to disable)
  require 'plugins.themes',
  require 'plugins.editor',
  require 'plugins.neo_tree',

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

