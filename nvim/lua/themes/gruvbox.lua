local M = {}

function M.apply(mode)
  vim.o.background = mode
  vim.cmd.colorscheme("gruvbox")
end

return M
