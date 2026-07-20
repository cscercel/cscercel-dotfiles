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

            local ok, ts = pcall(require, "nvim-treesitter")
            if ok and ts.install then
                ts.install(parsers)
            end

            -- Neovim 0.12 bug: the bundled markdown query's conceal_lines
            -- predicate on fenced_code_block_delimiter crashes the highlighter.
            -- Override just that capture to drop the crashing directive.
            -- Tracking: nvim-treesitter/nvim-treesitter#8618
            vim.treesitter.query.set("markdown", "highlights", [[
                (fenced_code_block
                  (fenced_code_block_delimiter) @punctuation.delimiter)
                (fenced_code_block
                  (info_string (language) @label))
            ]])

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
