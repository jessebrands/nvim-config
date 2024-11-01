local lazy = {}

function lazy.bootstrap(path)
	if not (vim.uv or vim.loop).fs_stat(path) then
		vim.fn.system({
			'git', 'clone',
			'--filter=blob:none',
			'--branch=stable',
			'https://github.com/folke/lazy.nvim.git',
			path
		})
	end
	vim.opt.rtp:prepend(path)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.bootstrap(lazy.path)

require('lazy').setup({
	-- Telescope: fuzzy finder
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	-- Treesitter: AST parsing and highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	-- Highlight TOOOs
	{
		'folke/todo-comments.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
		dependencies = {
			{ 'neovim/nvim-lspconfig' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/nvim-cmp' },
		},
	},
	-- Auto-completion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 
				'L3MON4D3/LuaSnip',
				build = (function() 
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
			},
			
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		},
	},
})

