return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
                })

            local parsers = {
                "c", "cpp", "cmake", "make",
                "bash", "lua", "python", "query", "vim", "vimdoc",
            }
            ts.install(parsers)

            --enable highlighting, indentation and folding for installed parsers
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    local buf = args.buf
                    local ft = vim.bo[buf].filetype

                    if not pcall(vim.treesitter.start, buf) then
                        return
                    end

                    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo.foldmethod = "expr"
                    vim.o.foldlevelstart = 99
                    vim.wo.foldenable = false

                    vim.bo[buf].indentexpr = ""
                    if ft == "c" or ft == "cpp" then
                        -- C/C++: treesitter indent is unreliable; use cindent
                        vim.bo[buf].cindent     = true
                        vim.bo[buf].smartindent = false
                    elseif ft == "lua" then
                        vim.bo[buf].smartindent = true
                    else
                        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}

