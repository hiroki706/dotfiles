-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.helplang = "ja"
vim.opt.spelllang = { "en", "cjk" }
-- 行wrap
vim.opt.wrap = true
vim.opt.linebreak = true

-- 相対行番号を無効化（常に絶対行番号）
vim.opt.relativenumber = false
vim.opt.number = true

-- 保存時の自動フォーマットを無効化
vim.g.autoformat = false

