-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
-- Ctrl+s: 保存, Ctrl+c: 終了, Ctrl+w: タブ閉じ, Alt+j: ノーマルモード
map({"n", "i"}, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<C-c>", "<cmd>qa<cr>", { desc = "Quit Neovim" })

map("n", "<C-w>", "<cmd>lua Snacks.bufdelete()<cr>", { desc = "Close Buffer" })

map("i", "<M-j>", "<Esc>", { silent = true })


-- 挿入モードの ↑↓ も見た目の行単位で動かす（補完メニューが出ているときはそちらを優先）
map("i", "<Down>", function() return vim.fn.pumvisible() == 1 and "<Down>" or "<C-o>gj" end, { expr = true })
map("i", "<Up>", function() return vim.fn.pumvisible() == 1 and "<Up>" or "<C-o>gk" end, { expr = true })

-- Alt+↑↓ で行を移動（LazyVim の <A-j>/<A-k>）
map({ "n", "i", "v" }, "<A-Down>", "<A-j>", { remap = true, desc = "Move line down" })
map({ "n", "i", "v" }, "<A-Up>", "<A-k>", { remap = true, desc = "Move line up" })

-- Shift+Alt+↑↓ で行を複製
map("n", "<S-A-Down>", "<cmd>t.<cr>", { desc = "Duplicate line down" })
map("n", "<S-A-Up>", "<cmd>t-1<cr>", { desc = "Duplicate line up" })
map("i", "<S-A-Down>", "<cmd>t.<cr>")
map("i", "<S-A-Up>", "<cmd>t-1<cr>")
map("x", "<S-A-Down>", ":t'><cr>gv", { silent = true })
map("x", "<S-A-Up>", ":t'<-1<cr>gv", { silent = true })
