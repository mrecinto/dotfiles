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
      map('gd', vim.lsp.buf.definition)
      map('K', vim.lsp.buf.hover)
      map('<leader>rn', vim.lsp.buf.rename)
      map('<leader>ca', vim.lsp.buf.code_action)
    end

    -- New Neovim 0.11+ API
    vim.lsp.config('lua_ls', {
      on_attach = on_attach,
    })

   vim.lsp.config('tinymist', {
      on_attach = on_attach,
      settings = {
        exportPdf = 'onSave',

        -- enable HTTP preview
        preview = {
          enabled = true,
          browser = "default", -- or "firefox", "chromium", etc.
          port = 23625,        -- any free port
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

