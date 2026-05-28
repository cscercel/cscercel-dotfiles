return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	    local configs = require("nvim-treesitter.configs")
	    configs.setup({
	        highlight = {
		    enable = true,
	        },
	        indent = { enable = true },
	        autotage = { enable = true },
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
                "go",
                "sql",
	        },
	        auto_install = false,
	})
    end
}
