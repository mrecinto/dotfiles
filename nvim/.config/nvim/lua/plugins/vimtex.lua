return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_syntax_conceal_disable = 1
    vim.g.vimtex_compiler_latexmk = {
      continuous = 1,
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-file-line-error",
      },
      hooks = {
        function()
          vim.fn.system([[
            mkdir -p build && \
            mv -f *.aux *.log *.fls *.fdb_latexmk *.synctex.gz build/ 2>/dev/null
          ]])
        end,
      },
    }

    vim.g.vimtex_quickfix_mode = 0
  end,
}
