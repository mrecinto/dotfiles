return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Mason: installs open-source servers ONLY
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

      map('gd', vim.lsp.buf.definition)
      map('K', vim.lsp.buf.hover)
      map('<leader>rn', vim.lsp.buf.rename)
      map('<leader>ca', vim.lsp.buf.code_action)

      map('<leader>e', vim.diagnostic.open_float)
      map('[d', vim.diagnostic.goto_prev)
      map(']d', vim.diagnostic.goto_next)
      map('<leader>q', vim.diagnostic.setloclist)
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


    -- Enable ONLY Mason-managed servers
    vim.lsp.enable({
      'lua_ls',
      'tinymist',
    })
  end,
}

