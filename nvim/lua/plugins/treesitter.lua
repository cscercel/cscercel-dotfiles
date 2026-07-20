return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup()

            local parsers = {
                "lua",
                "python",
                "toml",
                "yaml",
                "json",
                "html",
                "css",
                "bash",
                "gitignore",
                "markdown",
                "markdown_inline",
                "javascript",
                "jsdoc",
                "typescript",
                "tsx",
                "go",
                "sql",
                "templ",
                "comment",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "query",
                "vim",
                "vimdoc",
            }

            vim.defer_fn(function()
                local status, ts = pcall(require, "nvim-treesitter")
                if status and ts.install then
                    ts.install(parsers)
                end
            end, 0)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = parsers,
                callback = function(args)
                    -- Turn on native Treesitter highlighting
                    pcall(vim.treesitter.start, args.buf)
                    -- Turn on Treesitter-based indentation
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
