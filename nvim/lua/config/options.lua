-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 对lazyvim 中默认的配置进行覆盖；

local opt = vim.opt
-- local g = vim.g

-- g.rust_recommended_style = 0
-- g.tmux_navigator_no_mappings = 1

-- 禁用语法检测
opt.spell = false
-- 自动折行
opt.wrap = true

-- 禁用相对行号
opt.relativenumber = true

-- 目前公Neovide 支持，即给 Neovide设置字体
opt.guifont = { "SFMono Nerd Font", ":h18" }

-- 设置空白字符
opt.list = true
opt.listchars = { space = "." }

-- Set conceal level to 0
vim.o.conceallevel = 0
vim.g.autoformat = false
vim.b.autoformat = false
vim.g.lsp_eslint_enable = "no"

-- windows 中设置shell 为pwsh7
-- opt.shell = "pwsh"
-- opt.shellcmdflag = "-command"
-- opt.shellquote = '"'
-- opt.shellxquote = ""

-- conceals 级别设置为0, conceals 是什么?我还没怎么弄明白
-- opt.conceallevel = 0

-- opt.wildmenu = true
-- opt.wildmode = "longest:list,full"
