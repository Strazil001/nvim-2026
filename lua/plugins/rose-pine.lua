return {
  "rose-pine/neovim",
  name = "rose-pine",
  opts = {
    variant = "auto",
    dark_variant = "main",
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = true,
      migrations = true,
    },

    styles = {
      bold = true,
      italic = true,
      transparency = true,
    },

    groups = {
      border = "muted",
      link = "iris",
      panel = "base",

      error = "love",
      hint = "iris",
      info = "foam",
      note = "pine",
      todo = "rose",
      warn = "gold",

      git_add = "foam",
      git_change = "rose",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",

      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },

    palette = {},

    highlight_groups = {
      NeoTreeNormal = { bg = "base", fg = "text", inherit = false },
      NeoTreeNormalNC = { bg = "base", fg = "text", inherit = false },
      NeoTreeWinSeparator = { fg = "surface", bg = "base", inherit = false },

      SnacksSidebarNormal = { bg = "base", inherit = false },
      SnacksSidebarNormalNC = { bg = "base", inherit = false },

      NormalFloat = { bg = "base", fg = "text", inherit = false },
      FloatBorder = { bg = "base", fg = "muted", inherit = false },

      TelescopeNormal = { bg = "base", inherit = false },
      TelescopeBorder = { bg = "base", inherit = false },
      TelescopePromptNormal = { bg = "base", inherit = false },
      TelescopePromptBorder = { bg = "base", inherit = false },

      SnacksPickerNormal = { bg = "base", inherit = false },
      SnacksPickerBorder = { bg = "base", inherit = false },

      CmpMenu = { bg = "base", fg = "text" },
      CmpMenuBorder = { bg = "base", fg = "muted" },
      CmpDoc = { bg = "base", fg = "text" },
      CmpDocBorder = { bg = "base", fg = "muted" },

      BlinkCmpMenu = { bg = "base", fg = "text" },
      BlinkCmpMenuBorder = { bg = "base", fg = "muted" },
      BlinkCmpDoc = { bg = "base", fg = "text" },
      BlinkCmpDocBorder = { bg = "base", fg = "muted" },
      PmenuSel = { bg = "overlay", fg = "rose" },
      BlinkCmpMenuSelection = { bg = "overlay", fg = "rose" },

      StatusLine = { bg = "base", fg = "text" },
      StatusLineNC = { bg = "base", fg = "muted" },

      -- Treesitter (markdown parser)
      ["@markup.italic"] = { fg = "gold", italic = true },
      ["@markup.strong"] = { fg = "love", bold = true },
      ["@markup.italic.markdown_inline"] = { fg = "gold", italic = true },
      ["@markup.strong.markdown_inline"] = { fg = "love", bold = true },

      -- Legacy syntax fallback
      markdownItalic = { fg = "gold", italic = true },
      markdownBold = { fg = "love", bold = true },
      ["@field"] = { fg = "foam" }, -- struct field names in literals/patterns
      ["@property"] = { fg = "foam" }, -- some rust queries use this instead of @field
      ["@variable.member"] = { fg = "foam" }, -- newer capture name in some parser versions

      ["@markup.raw.markdown_inline"] = { fg = "love", bg = "#191724" },
      -- fallback for older treesitter/legacy syntax:
      ["@text.literal.markdown_inline"] = { fg = "love", bg = "#191724" },
      markdownCode = { fg = "love", bg = "#191724" },
      RenderMarkdownCode = { bg = "#191724" },
      RenderMarkdownCodeInline = { fg = "foam", bg = "#1f1d2e", italic = true },
    },

    before_highlight = function(group, highlight, palette) end,
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}
