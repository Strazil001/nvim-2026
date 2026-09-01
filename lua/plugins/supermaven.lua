return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter", -- lazy-load when you start typing
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-c>",
      accept_word = "<C-\\>",
    },
    ignore_filetypes = { "", "", "" }, -- add any filetypes you want to exclude
    log_level = "info", -- set to "off" to disable logging
    disable_inline_completion = false, -- required to have accept_suggestion keymap work
    disable_keymaps = false, -- disable built-in keymaps if you want to define your own
    condition = function()
      return false -- return true to disable Supermaven for a given buffer/condition
    end,
  },
}
