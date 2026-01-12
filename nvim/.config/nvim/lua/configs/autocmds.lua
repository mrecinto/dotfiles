



vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      local target = vim.fn.expand("<cfile>")
      if target == "" then return end

      -- Absolute directory of the current buffer
      local buf_dir = vim.fn.expand("%:p:h")

      -- Resolve target relative to buffer directory
      local path = buf_dir .. "/" .. target
      path = vim.fn.fnamemodify(path, ":p")

      if vim.fn.filereadable(path) == 1 then
        vim.fn.jobstart({ "xdg-open", path }, { detach = true })
      else
        -- fallback to normal Enter
        vim.cmd("normal! <CR>")
      end
    end, { buffer = true, silent = true })
  end,
})



vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldlevel = 99      -- start unfolded
  end,
})



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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "neo-tree",
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})

