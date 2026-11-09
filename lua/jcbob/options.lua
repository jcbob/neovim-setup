local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = true

-- Indentation
opt.tabstop      = 4
opt.softtabstop  = 4
opt.shiftwidth   = 4
opt.expandtab    = true
opt.smartindent  = true
opt.wrap = true

-- No swap/backup files
opt.swapfile = false
opt.backup   = false

-- Persistent undo (create dir if missing)
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
opt.undodir   = undodir
opt.undofile  = true

-- Search
opt.hlsearch  = false
opt.incsearch = true

-- UI
opt.termguicolors = true
opt.scrolloff     = 16
opt.signcolumn    = "yes"
opt.isfname:append("@-@")
opt.updatetime = 250
opt.timeoutlen = 300
