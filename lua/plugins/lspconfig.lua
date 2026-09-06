return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- Voorkom dat nvim-lspconfig rust_analyzer start om conflicten te vermijden
        rust_analyzer = { enabled = false },

        -- Je huidige PowerShell configuratie
        powershell_es = {
          bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
          cmd = {
            "pwsh",
            "-NoLogo",
            "-NoProfile",
            "-Command",
            vim.fn.stdpath("data")
              .. "/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1"
              .. " -BundledModulesPath '"
              .. vim.fn.stdpath("data")
              .. "/mason/packages/powershell-editor-services'"
              .. " -Stdio"
              .. " -LogLevel 'Information'",
          },
          filetypes = { "ps1" },
        },
      },
    },
  },
}
