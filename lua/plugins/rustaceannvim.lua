return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          -- Updated root_dir to safely handle Codewars files
          root_dir = function(filename)
            -- Search upward for standard project indicators
            local roots = vim.fs.find({ "Cargo.toml", ".git" }, { upward = true, path = filename })

            if #roots > 0 then
              return vim.fs.dirname(roots[1]) -- Return the project directory
            end

            -- Fallback: If no Cargo.toml or .git is found, treat the file's folder as the root
            return vim.fs.dirname(filename)
          end,
          default_settings = {
            ["rust-analyzer"] = {
              -- Essential fix for isolated standalone files
              linkedProjects = {},
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
