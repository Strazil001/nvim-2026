-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<Esc>", { silent = true })

-- Let Wezterm use Alt for pane hopping and move lines with leader instead.
vim.keymap.del({ "n", "i", "v" }, "<A-j>")
vim.keymap.del({ "n", "i", "v" }, "<A-k>")

map("n", "<leader>j", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<leader>k", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<leader>j", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<leader>k", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<leader>j", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<leader>k", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
