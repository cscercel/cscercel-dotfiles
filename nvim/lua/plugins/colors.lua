return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,
                    transparency = true,
                },
            })
            vim.cmd("colorscheme rose-pine-moon")
        end
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require('lualine').setup({
                options = {
                    theme = "onedark",
                },
            })
        end
    },
}
