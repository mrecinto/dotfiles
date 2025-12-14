return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Theme settings
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_better_performance = 1

      -- Make it permanent
      vim.cmd 'colorscheme gruvbox-material'
    end,
  },
}
