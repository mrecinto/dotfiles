-- lua/plugins/init.lua

-- Bootstrap lazy.nvim FIRST
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Now lazy is guaranteed to exist
require("lazy").setup({
  { import = "plugins.themes" },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("ui.themery")
    end,
  },
})

