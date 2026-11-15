-- Save
vim.keymap.set("n", "<leader>w",  "<cmd>w<CR>",         {desc = "Save file" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex,           {desc = "Open netrw" })

-- Window splitting
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>",    {desc = "[s]plit [v]ertical"})
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>",     {desc = "[s]plit [h]oritzontal"})
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>",     {desc = "[s]plit e[x]it"})

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Window right" })

-- Move selected lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered on page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n",     "nzzzv")
vim.keymap.set("n", "N",     "Nzzzv")

-- Folding
vim.keymap.set("n", "<leader>fo", "zR",                 {desc = "[f]old [o]pen all"})
vim.keymap.set("n", "<leader>fc", "zM",                 {desc = "[f]old [c]lose all"})
vim.keymap.set("n", "<leader>ft", "za",                 {desc = "[f]old [t]oggle"})




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



-- LSP keymaps (buffer-local; only active in buffers with an attached server)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, desc = "LSP" }
        vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     opts)
        vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,    opts)
        vim.keymap.set("n", "gi",         vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr",         vim.lsp.buf.references,     opts)
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,          opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,         opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,    opts)
        vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float,  opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
    end,
})

-- Diagnostics styling (global, applied once)
vim.diagnostic.config({
    virtual_text     = true,
    signs            = true,
    underline        = true,
    update_in_insert = false,
    severity_sort    = true,
})
