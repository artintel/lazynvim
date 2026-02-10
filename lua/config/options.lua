-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options herevim.g.mapleader = "\\"
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.g.autoformat = false

vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "o", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "O", "O<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>", ":", {})
vim.o.clipboard = "unnamedplus" -- 用系统剪贴板当默认寄存器

vim.keymap.set("n", "<S-Up>", ":resize -1<CR>", { silent = true })
vim.keymap.set("n", "<S-Down>", ":resize +1<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":vertical resize -1<CR>", { silent = true })
vim.keymap.set("n", "<S-Right>", ":vertical resize +1<CR>", { silent = true })
