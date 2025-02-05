-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds hereby
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
-- Disable autoformat for lua files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),

  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false -- 覆盖默认的 true
    vim.b.autoformat = false
  end,
})

-- 确保在LSP 配置完成之前关闭virtual_text
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({
      virtual_text = false, -- Disable virtual text
      underline = false
    })
  end,
})

-- vim.diagnostic.config({
--   virtual_text = false,
--   underline = false
-- })
