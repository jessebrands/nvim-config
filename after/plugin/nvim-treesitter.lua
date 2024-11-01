local configs = require('nvim-treesitter.configs')

configs.setup({
	ensure_installed = { 'lua', 'go', 'gotmpl', 'gomod', 'gosum' },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})

