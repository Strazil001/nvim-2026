-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.shell = "pwsh"

vim.opt.timeoutlen = 150

vim.opt.scrolloff = 999

vim.opt.directory = os.getenv("TEMP") .. "/nvim-swap//"

vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

vim.g.lazyvim_prettier_needs_config = false
