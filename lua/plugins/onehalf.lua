return {
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        types = "bold", -- Stand out for types and classes
        methods = "NONE", -- Keep normal to avoid visual clutter
        numbers = "NONE", -- Normal
        strings = "NONE", -- Normal
        comments = "italic", -- Keeps comments distinct and secondary
        keywords = "bold,italic", -- Strong emphasis for control flow (if/else/return)
        constants = "bold", -- Makes constants easily noticeable
        functions = "bold", -- Crucial for tracking function calls
        operators = "NONE", -- Normal
        variables = "NONE", -- Keep normal so logic doesn't get too loud
        parameters = "italic", -- Helps distinguish inputs from local variables
        conditionals = "bold,italic", -- Highlights logic branches clearly
        virtual_text = "italic", -- Normal
      },
      highlights = {
        LspInlayHint = {
          italic = true,
          fg = "#4b5263",
        },
        -- Completion Menu Background (Slightly darker tinted background)
        BlinkCmpMenu = { bg = "#282c34" },
        BlinkCmpMenuBorder = { fg = "#abb2bf", bg = "#282c34" }, -- fg maps to purple

        -- Documentation Window Background
        BlinkCmpDoc = { bg = "#282c34" }, -- Marginally darker than menu for definition
        BlinkCmpDocBorder = { fg = "#abb2bf", bg = "#282c34" },

        -- Active Selection Highlight Row
        BlinkCmpMenuSelection = { bg = "#2c313c", fg = "#abb2bf", bold = true },
      },
      options = {
        cursorline = true,
        transparency = true,
        terminal_colors = true,
        lualine_transparency = true,
      },
    },
  },

  -- Configure LazyVim to load onehalfdark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
