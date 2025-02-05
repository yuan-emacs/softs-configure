-- keymaps are automatically loaded on the verylazy event
-- default keymaps that are always set: https://github.com/lazyvim/lazyvim/blob/main/lua/lazyvim/config/keymaps.lua
-- add any additional keymaps here
-- local keymap = vim.keymap
local upmap = vim.keymap.del
local map = LazyVim.safe_keymap_set
local originMap = vim.keymap.set

-- 复用 opt 参数
local opt = { noremap = true, silent = true }
upmap("n", "<leader><space>")
-- upmap("n", "<leader>ww")

originMap("n", "<leader>ww", "<cmd>vsplit<cr>", { desc = "vsplit" })
originMap("n", "<leader>dj", "<cmd>Sexplore<cr>", { desc = "show current dir", silent=true, noremap=true })
originMap("n", "<leader><space>", "<c-w>o", { remap = true  })

-- upmap("n","<space>ww", opt)

-- 取消一些emacs中常用的快捷键, 后面会重新设置
-- upmap("i", "<C-f>", opt)
-- upmap("i", "<C-b>", opt)

map("n", "gcd", "o<esc>vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "add comment below" })
map("n", "gcu", "o<esc>vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "add comment above" })

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
-- map("n","<leader>ww","" , opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-a>", "<ESC>I", opt)
map("i", "<C-e>", "<ESC>A", opt)

map("n", "<A-l>", "zz", opt)
map("n", "<A-k>", "v$x", opt)
-- map({"n", "v", "i"}, "<A-x>", "<cmd>", opt)

originMap("n", "<C-a>", "0", opt)
originMap("v", "<C-a>", "0", opt)
originMap("n", "<C-e>", "$", opt)
originMap("v", "<C-e>", "$", opt)

-- 我想实现要 insert 模式下： shift + enter 换行，像eclipse 那样
map("i", "<S-Enter>", "<ESC>o", opt)
originMap("n", "<S-CR>", "<ESC>o", opt)

originMap("i", "<C-p>", "<Up>", opt)
originMap("i", "<C-n>", "<Down>", opt)
originMap("i", "<C-f>", "<Right>", opt)
originMap("i", "<C-b>", "<Left>", opt)
originMap({ "i", "v" }, "<C-g>", "<ESC>", opt)

-- LazyVim.ui.maximize():map("<leader>tm")

-- local escape_code = vim.api.nvim_replace_termcodes(
--     "<Esc>",
--     false, false, true
-- )
-- local backspace_code = vim.api.nvim_replace_termcodes(
--     "<BS>",
--     false, false, true
-- )
-- local function viml_backspace()
--     -- expression from a deleted reddit user
--     vim.cmd([[
--         let g:exprvalue =
--         \ (&indentexpr isnot '' ? &indentkeys : &cinkeys) =~? '!\^F' &&
--         \ &backspace =~? '.*eol\&.*start\&.*indent\&' &&
--         \ !search('\S','nbW',line('.')) ? (col('.') != 1 ? "\<C-U>" : "") .
--         \ "\<bs>" . (getline(line('.')-1) =~ '\S' ? "" : "\<C-F>") : "\<bs>"
--         ]])
--     return vim.g.exprvalue
-- end
--
-- local function backspace()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     local before_cursor_is_whitespace = vim.api.nvim_get_current_line()
--         :sub(0, col)
--         :match("^%s*$")
--
--     if not before_cursor_is_whitespace then
--         return require('nvim-autopairs').autopairs_bs()
--     end
--     if line == 1 then
--         return viml_backspace()
--     end
--     local correct_indent = require("nvim-treesitter.indent").get_indent(line)
--     local current_indent = vim.fn.indent(line)
--     local previous_line_is_whitespace = vim.api.nvim_buf_get_lines(
--         0, line - 2, line - 1, false
--     )[1]:match("^%s*$")
--     if current_indent == correct_indent then
--         if previous_line_is_whitespace then
--             return viml_backspace()
--         end
--         return backspace_code
--     elseif current_indent > correct_indent then
--         return escape_code .. "==0wi"
--     end
--     return backspace_code
-- end
--
-- map("i", '<BS>', backspace, {expr = true, noremap = true, replace_keycodes = false})
-- map("i", '<BS>', "<ESC>%s/\\s\\{8\\}/\t/g ", {expr = true, noremap = true, replace_keycodes = false})
-- map('i', '<S-BS>', '<BS>', opt)
--
