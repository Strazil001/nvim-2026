return {
  "folke/snacks.nvim",
  opts = {
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 5, total = 100 }, -- Default is step=10, total=200
        easing = "linear",
      },
    },
    dashboard = {
      preset = {
        header = [[
                                                                      
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████
        ]],
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
