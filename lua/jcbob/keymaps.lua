-- Save
vim.keymap.set("n", "<leader>w",  "<cmd>w<CR>",         { desc = "Save file" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex,           { desc = "Open netrw" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Window right" })

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered on page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n",     "nzzzv")
vim.keymap.set("n", "N",     "Nzzzv")






-- Python: run current file in a split terminal
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("w")
    vim.cmd("split | terminal python3 " .. vim.fn.expand("%"))
end, { desc = "Run current Python file" })

-- Python: quick one-off execution (blocks; press Enter to dismiss)
vim.keymap.set("n", "<leader>x", function()
    vim.cmd("w")
    vim.cmd("!python3 " .. vim.fn.expand("%"))
end, { desc = "Quick-run current Python file" })
