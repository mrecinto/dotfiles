-- highlight after yanking/copying
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 150,
    })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local argc = vim.fn.argc()
    local argv = vim.fn.argv(0)

    -- If Neovim was started with a directory: `nvim .`
    if argc == 1 and vim.fn.isdirectory(argv) == 1 then
      vim.cmd("Neotree show")
    end
  end,
})

