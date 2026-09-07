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

    opts.options.theme = function()
      local p = require("rose-pine.palette")

      local function mode(color)
        return {
          a = { bg = color, fg = p.base, gui = "bold" },
          b = { bg = p.surface, fg = p.text },
          c = { bg = p.base, fg = p.text },
        }
      end

      return {
        normal = mode(p.rose),
        insert = mode(p.foam),
        visual = mode(p.iris),
        replace = mode(p.love),
        command = mode(p.pine),
        terminal = mode(p.muted),
        inactive = {
          a = { bg = p.base, fg = p.muted },
          b = { bg = p.base, fg = p.muted },
          c = { bg = p.base, fg = p.muted },
        },
      }
    end

    opts.sections = opts.sections or {}

    -- CUSTOM MODUS INDICATOR MET NERD SYMBOLEN
    opts.sections.lualine_a = {
      {
        function()
          -- Map Neovim modi naar jouw gewenste symbolen en letters
          local mode_map = {
            ["n"] = "   󰰒 ",
            ["no"] = "   󰰒  󰰕 ",
            ["v"] = "   󰰪 ",
            ["V"] = "   󰰪  󰰌 ",
            ["s"] = "   󰰡 ",
            ["\22"] = "   󰰪  󰯮 ", -- Visual Block (\22 is Ctrl-V)
            ["S"] = "   󰰡  󰰌 ",
            ["\19"] = "   󰰡  󰯮 ",
            ["i"] = "   󰰃 ",
            ["ic"] = "   󰰃  󰯱 ",
            ["R"] = "   󰰞 ",
            ["Rv"] = "   󰰪  󰰞 ",
            ["c"] = "   󰯱 ",
            ["cv"] = "    ",
            ["ce"] = "    ",
            ["r"] = "    ",
            ["rm"] = "    ",
            ["r?"] = "    ",
            ["!"] = "    ",
            ["t"] = "    ",
          }

          local m = vim.api.nvim_get_mode().mode
          return mode_map[m] or m
        end,
        separator = { left = "", right = "" },
        right_padding = 2,
      },
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
          newfile = " ", -- somewhat redundant if using newfile highlight
          ellipsis = "…", -- used between shortened directory parts
        },
        path_sep = "  ",
        highlights = {},
        directories = {
          enable = true,
          shorten = true,
          max_depth = 2,
        },
      },
    }
    opts.sections.lualine_z = {
      { "location", separator = { right = "", left = "" }, left_padding = 2 },
    }
  end,
}
