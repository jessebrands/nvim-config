local cmp = require('cmp')
local luasnip = require('luasnip')
luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
	  	-- documentation = cmp.config.window.bordered(),
	},
	-- completion = { completeopt = 'menu,menuone,noinsert' },
	mapping = cmp.mapping.preset.insert {
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
})

