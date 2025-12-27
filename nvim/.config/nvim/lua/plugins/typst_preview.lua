return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',

  opts = {
    debug = false,

    -- if you want to open with default browser
    -- open_cmd = nil

    -- open_cmd = "firefox --new-window %s",
    -- this one works vvv
    -- open_cmd = "flatpak run app.zen_browser.zen --new-window %s",
    --
    --
    -- this one works too vv but for when opening and killing
    -- zen browser
    -- open_cmd = "~/.local/bin/typst-zen-preview %s",
    -- open_cmd = "qutebrowser %s",
    open_cmd = "qutebrowser --target window %s",



    port = 0,

    -- Dark / light behavior
    -- invert_colors = 'never',
    invert_colors = 'auto',


    follow_cursor = true,

    dependencies_bin = {
      tinymist = nil,
      websocat = nil,
    },

    extra_args = nil,

    get_root = function(path_of_main_file)
      local root = os.getenv 'TYPST_ROOT'
      if root then
        return root
      end
      return vim.fn.fnamemodify(path_of_main_file, ':p:h')
    end,

    get_main_file = function(path_of_buffer)
      return path_of_buffer
    end,
  },

  build = function()
    require('typst-preview').update()
  end,
}

