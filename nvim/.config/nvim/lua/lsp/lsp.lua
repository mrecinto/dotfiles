return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Mason: installs servers
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'tinymist',
      },
    })

    -- Shared on_attach
    local on_attach = function(_, bufnr)
      local map = function(lhs, rhs)
        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, silent = true })
      end

      -- LSP navigation
      map('gd', vim.lsp.buf.definition)
      map('K', vim.lsp.buf.hover)
      map('<leader>rn', vim.lsp.buf.rename)
      map('<leader>ca', vim.lsp.buf.code_action)

      -- Diagnostics
      map('<leader>e', vim.diagnostic.open_float) -- show diagnostic under cursor
      map('[d', vim.diagnostic.goto_prev)         -- previous diagnostic
      map(']d', vim.diagnostic.goto_next)         -- next diagnostic
      map('<leader>q', vim.diagnostic.setloclist) -- list diagnostics
    end

    -- Lua LSP
    vim.lsp.config('lua_ls', {
      on_attach = on_attach,
    })

    -- Typst (tinymist)
    vim.lsp.config('tinymist', {
      on_attach = on_attach,
      settings = {
        exportPdf = 'onSave',
        preview = {
          enabled = true,
          browser = "default",
          port = 23625,
        },
      },
    })

    -- Enable servers
    vim.lsp.enable({
      'lua_ls',
      'tinymist',
    })
  end,
}

