vim.g.mapleader = " "

local keymap = vim.keymap 

-- use jj to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<C-h>", "<C-w>h", { desc = "Переход к левому окну" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Переход к нижнему окну" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Переход к верхнему окну" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Переход к правому окну" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab


