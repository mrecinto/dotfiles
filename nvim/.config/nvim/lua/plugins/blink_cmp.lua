return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  opts = {
    keymap = {
      preset = 'default',
      -- ['<CR>'] = { 'accept', 'fallback' },
      ['<M-y>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<C-space>'] = { 'show' },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
    },

    sources = {
      providers = {
        lsp = { name = "lsp" },
        buffer = { name = "buffer" },
        snippets = { name = "luasnip" },
      },

      per_filetype = {
        markdown = { "snippets", "buffer" },
        markdown_inline = { "snippets", "buffer" },
      },

      default = { "lsp" },
    },

    cmdline = {
      sources = { 'cmdline', 'path' },
    },
  },
}

