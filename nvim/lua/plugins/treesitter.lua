return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
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
            },
            auto_install = false,
        })
    end
}
