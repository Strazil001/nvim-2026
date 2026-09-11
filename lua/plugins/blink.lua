return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },
    },
    keymap = {
      preset = "none", -- Clear default keymaps to avoid conflicts

      ["<CR>"] = { "fallback" }, -- Disable Enter from accepting completions
      ["<C-y>"] = { "select_and_accept" }, -- Confirm selection

      ["<C-n>"] = { "select_next", "fallback" }, -- Navigate down
      ["<C-p>"] = { "select_prev", "fallback" }, -- Navigate up

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}
