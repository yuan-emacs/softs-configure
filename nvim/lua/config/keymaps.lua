-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps here
-- local keymap = vim.keymap
local upmap = vim.keymap.del
local map = LazyVim.safe_keymap_set

upmap("n", "<leader><space>", { desc = "find files (root dir)" })

map("n", "gcd", "o<esc>vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "add comment below" })
map("n", "gcu", "o<esc>vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "add comment above" })

LazyVim.ui.maximize():map("<leader>tm")
