-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  --'windwp/nvim-autopairs',
  --event = 'InsertEnter',
  --opts = {},
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {
    disablee_in_macro = false,
    map_cr = false, -- Set this to false
  },
}
