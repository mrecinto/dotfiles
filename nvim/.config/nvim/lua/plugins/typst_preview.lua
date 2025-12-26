return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',

  opts = {
    debug = false,

    -- Open Typst preview in a NEW Zen Browser window
    -- open_cmd = "flatpak run --branch=stable io.github.zen_browser.zen --new-window %s",
    open_cmd = nil,
    port = 0,

    -- Dark / light behavior
    invert_colors = 'never',

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

