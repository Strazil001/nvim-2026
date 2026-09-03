return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "bwpge/lualine-pretty-path",
  },
  opts = function(_, opts)
    local icons = LazyVim.config.icons

    opts.options = opts.options or {}
    opts.options.component_separators = { left = "", right = "" }

    -- Clear default section separators to remove solid powerline arrows between middle sections
    opts.options.section_separators = { left = "", right = "" }

    opts.sections = opts.sections or {}

    opts.sections.lualine_a = {
      { "mode", separator = { left = "", right = "" }, right_padding = 2 },
    }

    opts.sections.lualine_c = {
      LazyVim.lualine.root_dir(),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      {
        "pretty_path",
        icon_show = false,
        icon_show_inactive = false,
        use_color = true,
        use_symbols = true,
        symbols = {
          modified = " ", -- somewhat redundant if using modified highlight
          readonly = " ",
          newfile = "", -- somewhat redundant if using newfile highlight
          ellipsis = "…", -- used between shortened directory parts
        },
        path_sep = "  ",
        highlights = {
          directory = "Comment",
          filename = { fg = "#61afef", bold = true },
          modified = { fg = "#e5c07b", bold = true, italic = true },
          path_sep = { fg = "#dcdfe4" },
        },
        directories = {
          enable = true,
          shorten = true,
          max_depth = 2,
        },
      },
    }
    -- Give the diff added/modified/removed symbols onedark pastel colors
    do
      local ok, colors = pcall(function()
        return require("onedarkpro.helpers").get_colors()
      end)
      for _, comp in ipairs(opts.sections.lualine_x or {}) do
        if type(comp) == "table" and comp[1] == "diff" then
          comp.diff_color = {
            added = { fg = ok and colors.green or "#98be65" },
            modified = { fg = ok and colors.yellow or "#ECBE7B" },
            removed = { fg = ok and colors.red or "#ec5f67" },
          }
        end
      end
    end
    -- Restore trouble.nvim symbol breadcrumb (function/class under cursor)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end
    opts.sections.lualine_z = {
      { "location", separator = { right = "", left = "" }, left_padding = 2 },
    }

    -- 1. Create a helper that strips bg colors ONLY from middle sections (b, c, x, y)
    local function make_transparent(theme)
      if not theme then
        return
      end
      for _, mode in pairs(theme) do
        if type(mode) == "table" then
          for section_name, section in pairs(mode) do
            -- Keep 'a' and 'z' intact so powerline separators render correctly
            if type(section) == "table" and section_name ~= "a" and section_name ~= "z" then
              section.bg = "none"
            end
          end
        end
      end
    end

    -- 2. Modify the lualine theme loaded by LazyVim
    if type(opts.options.theme) == "string" then
      local ok, theme = pcall(require, "lualine.themes." .. opts.options.theme)
      if ok then
        make_transparent(theme)
        opts.options.theme = theme
      end
    elseif type(opts.options.theme) == "table" then
      make_transparent(opts.options.theme)
    end
  end,
}
