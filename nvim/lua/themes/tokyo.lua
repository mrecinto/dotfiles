local M = {}

function M.apply(mode)
  vim.o.background = mode
  if mode == "dark" then
    vim.cmd.colorscheme("tokyonight-night")
  else
    vim.cmd.colorscheme("tokyonight-day")
  end
end

return M
