-- vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>")
-- vim.keymap.set("n", "<leader>tp", ":Tp<CR>")


-- vim.keymap.set("n", "<leader>ts", ":TypstStopAll<CR>")

-- vim.api.nvim_create_user_command("TypstStopAll", function()
--   vim.cmd("TypstPreviewStop")
--   os.execute("flatpak kill app.zen_browser.zen 2>/dev/null")
-- end, {})
--
-- vim.api.nvim_create_user_command("Tp", function()
--   local has_qute = os.execute("pgrep -x qutebrowser >/dev/null 2>&1")
--
--   if has_qute == 0 then
--     -- qutebrowser is running → close it
--     os.execute("pkill -x qutebrowser")
--   else
--     -- not running → start typst preview
--     vim.cmd("TypstPreview")
--   end
-- end, {})
--
--
--
-- ok this works vvv to open the qutebrowser once and closes
-- when calling the command again.
vim.g.typst_preview_open = false

vim.api.nvim_create_user_command("Tp", function()
  if vim.g.typst_preview_open then
    -- CLOSE
    vim.cmd("TypstPreviewStop")
    -- os.execute("pkill -x qutebrowser")
    vim.g.typst_preview_open = false
  else
    -- OPEN
    vim.cmd("TypstPreview")
    vim.g.typst_preview_open = true
  end
end, {})

vim.keymap.set("n", "<leader>tp", ":Tp<CR>")


