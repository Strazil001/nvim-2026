return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- Ensure markdown uses prettier
        markdown = { "prettier" },
      },
      formatters = {
        prettier = {
          -- "--prose-wrap always" forces wrapping on save
          -- "--print-width 80" defines the line limit
          args = { "--stdin-filepath", "$FILENAME", "--prose-wrap", "always", "--print-width", "80" },
        },
      },
    },
  },
}
