return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          root_dir = function(filename)
            local util = require("lspconfig.util")
            return util.root_pattern("Cargo.toml", ".git")(filename)
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = true,
              check = { command = "clippy" },
              inlayHints = { lifetimeElisionHints = { enable = "always" } },
            },
          },
        },
      }
    end,
  },
}
