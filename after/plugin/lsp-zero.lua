local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

-- Setup LSP actions
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }

		local map = function(keys, func, desc, mode) 
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
		end

		map('<leader>gd', require('telescope.builtin').lsp_definitions, '[g]oto [d]efinitions')
		map('<leader>gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')
		map('<leader>gr', require('telescope.builtin').lsp_references, '[g]oto [r]references')
		map('<leader>gi', require('telescope.builtin').lsp_implementations, '[g]oto [i]mplementations')
		map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
	end,
})

-- Configure LSP servers
require('lspconfig').gopls.setup({})

