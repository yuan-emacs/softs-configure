-- 对lazyvim 中默认的配置进行覆盖；

local opt = vim.opt
local g = vim.g

g.rust_recommended_style = 0
g.tmux_navigator_no_mappings = 1

-- 禁用语法检测
opt.spell = false
-- 自动折行
opt.wrap = true

-- 禁用相对行号
opt.relativenumber = false

-- 目前公Neovide 支持，即给 Neovide设置字体
opt.guifont = { "SFMono Nerd Font", ":h18" }

-- 设置空白字符
opt.list = true
opt.listchars = { space = "." }

-- windows 中设置shell 为pwsh7
opt.shell = "pwsh"
opt.shellcmdflag = "-command"
opt.shellquote = '"'
opt.shellxquote = ""

-- conceals 级别设置为0, conceals 是什么?我还没怎么弄明白
opt.conceallevel = 0

-- opt.wildmenu = true
-- opt.wildmode = "longest:list,full"
