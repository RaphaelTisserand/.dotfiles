return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "windwp/nvim-ts-autotag" },
	config = function ()
		local ts = require('nvim-treesitter.configs')

		ts.setup({
			additional_vim_regex_highlighting = false,
			enable = true,
			ensure_installed = {
				"bash",
				"cpp",
				"c",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"markdown",
				"python",
				"rust",
				"yaml",
				"toml",
			},
			ignore_install = {},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end
}
