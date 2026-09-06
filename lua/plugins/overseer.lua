return {
  {
    "stevearc/overseer.nvim",
    -- By setting 'lazy = false', we guarantee it loads immediately on startup
    lazy = true,
    config = function(_, opts)
      local overseer = require("overseer")
      overseer.setup(opts) -- Required core initialization

      -- 1. Register your template explicitly
      overseer.register_template({
        name = "Run OmniRoute Server",
        desc = "Start the core local AI gateway proxy and dashboard",
        builder = function()
          return {
            cmd = { "omniroute", "serve", "--no-open" },
            components = {
              { "on_output_quickfix", open = false },
              "unique", -- Built-in component protecting duplicate instances
              "default",
            },
          }
        end,
      })

      -- 2. Run it immediately since the plugin and template are fully loaded
      --overseer.run_task({ name = "Run OmniRoute Server" })
    end,
  },
}
