return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    require("nvim-web-devicons").set_icon({
     typ = {
      icon = "𝙏",
      color = "#239dad",
      name = "Typst",
    },
     md = {
        icon = "󰍔",
        color = "#519aba",
        name = "Markdown",
      },
      js = {
        icon = "󰌞",
        color = "#f7df1e",
        name = "JavaScript",
      },
    })
  end,
}

