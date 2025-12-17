return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
      ['<C-space>'] = { 'show' },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
    },

    -- INSERT MODE SOURCES
    sources = {
      default = { 'lsp' },
    },

    -- COMMAND-LINE SOURCES (NEW LOCATION)
    cmdline = {
      sources = { 'cmdline', 'path' },
    },

    completion = {
      trigger = {
        show_on_insert = false, 
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 150,
      },
    },
  },
}

