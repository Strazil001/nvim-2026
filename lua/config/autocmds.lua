-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    -- Enable visual line wrap
    vim.opt_local.wrap = true
    -- Set the hard wrap limit to 80 characters
    vim.opt_local.textwidth = 80
    -- 't' auto-wraps text using textwidth, 'c' auto-wraps comments
    vim.opt_local.formatoptions:append("tc")
  end,
})
