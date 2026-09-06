return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 2, total = 50 }, -- Default is step=10, total=200
        easing = "linear",
      },
    },
    picker = {
      layout = {
        layout = {
          backdrop = false, -- Removes the dark dim layer behind the floating window
        },
      },
      sources = {
        notifications = {
          win = {
            input = {
              keys = {
                ["<C-y>"] = { "yank", mode = { "i", "n" } },
              },
            },
          },
        },
      },
    },
  },
}
