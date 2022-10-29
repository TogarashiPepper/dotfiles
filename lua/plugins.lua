vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'frazrepo/vim-rainbow'
	use 'leafgarland/typescript-vim'
	-- use 'mhinz/vim-signify'
	-- use 'tpope/vim-fugitive'
	use 'morhetz/gruvbox'
	use 'tomasiser/vim-code-dark'
	-- use 'preservim/nerdtree'
	-- use 'rstacruz/vim-closer'
	use 'rust-lang/rust.vim'
	use 'ianks/vim-tsx'
	use 'tpope/vim-commentary'
	use 'ap/vim-css-color'
	use { 'glepnir/lspsaga.nvim', config = function()
		local saga = require 'lspsaga'
		saga.init_lsp_saga()
	end }
	use { 'kosayoda/nvim-lightbulb', config = function()
		require('nvim-lightbulb').setup({})
		vim.cmd [[ let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '000000') ]]
	end
	}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
		require 'nvim-treesitter.configs'.setup {
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
		}
	end }
	use 'alvan/vim-closetag'
	use 'ryanoasis/vim-devicons'
	use { 'dracula/vim', as = 'dracula' }
	use {
		'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
		config = function()
			require 'toggle_lsp_diagnostics'.init({ start_on = true })
		end
	}
	use {
		'romgrk/barbar.nvim',
		config = function()
			vim.cmd [[ let bg_inactive = s:bg(['TabLineFill', 'StatusLine'], '#000000') ]]
		end,
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/nvim-lsp-installer' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use "liuchengxu/vim-which-key"
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'stevearc/dressing.nvim' }
	use { 'mrjones2014/legendary.nvim' }
	-- use 'olimorris/onedarkpro.nvim'
	use 'tiagofumo/vim-nerdtree-syntax-highlight'
	use { 'peitalin/vim-jsx-typescript', requires = { 'leafgarland/typescript-vim' } }
	use 'folke/tokyonight.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- use {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- }
	use {
		'stevearc/aerial.nvim',
	}
	-- use {
	-- 	'lewis6991/gitsigns.nvim',
	-- }
	use {
		"olimorris/onedarkpro.nvim",
		config = function()
			require("onedarkpro").setup({
				theme = "onedark", -- The default dark theme
			})
		end
	}
	use 'xiyaowong/nvim-transparent'
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}
	use 'kovisoft/slimv'
end)
