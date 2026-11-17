-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({"n", "i"}, "<C-s>", "<cmd>w<cr>", {
    desc = "Save file"
})

vim.keymap.set("n", "<C-c>", "<cmd>qa<cr>", {
    desc = "Quit Neovim"
})

vim.keymap.set("n", "<C-w>", "<cmd>lua Snacks.bufdelete()<cr>", {
    desc = "Close Buffer"
})

vim.keymap.set("i", "<M-j>", "<Esc>", { silent = true })
