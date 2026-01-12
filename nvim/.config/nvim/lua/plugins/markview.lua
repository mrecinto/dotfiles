-- For `plugins/markview.lua` users.
return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts ={
      renderers={

        latex = {enable = false,},
        typst = {enable = false,},
      }

    },

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
};
