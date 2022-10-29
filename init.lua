require("plugins")
require("theme")
require("opts")

local lsp = require('lsp-zero')

require("transparent").setup({
	enable = true, -- boolean: enable transparent
	extra_groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	exclude = {}, -- table: groups you don't want to clear
})

require('lualine').setup {
	options = {
		theme = 'onedarkpro',
		disabled_filetypes = { "NvimTree" }
	}
}

require("aerial").setup({
	backends = { "lsp", "treesitter" },
	close_behavior = "auto",
	default_bindings = true,
	default_direction = "prefer_right",
	disable_max_lines = 10000,
	disable_max_size = 2000000, -- Default 2MB
	filter_kind = false,
	highlight_mode = "split_width",
	highlight_closest = true,
	highlight_on_hover = true,
	highlight_on_jump = 800,
	icons = {},
	ignore = {
		unlisted_buffers = true,
		filetypes = {},
		buftypes = "special",
		wintypes = "special",
	},
	link_folds_to_tree = false,
	link_tree_to_folds = true,
	manage_folds = false,
	max_width = { 40, 0.2 },
	width = nil,
	min_width = 10,
	nerd_font = "auto",
	on_attach = nil,
	on_first_symbols = nil,
	open_automatic = false,
	placement_editor_edge = false,
	post_jump_cmd = "normal! zz",
	close_on_select = false,
	show_guides = true,
	update_events = "TextChanged,InsertLeave",
	guides = {
		mid_item = "├─",
		last_item = "└─",
		nested_top = "│ ",
		whitespace = "  ",
	},
	float = {
		border = "rounded",
		relative = "cursor",
		max_height = 0.9,
		height = nil,
		min_height = { 8, 0.1 },

		override = function(conf)
			return conf
		end,
	},

	lsp = {
		diagnostics_trigger_update = true,
		update_when_errors = true,
		update_delay = 300,
	},

	treesitter = {
		update_delay = 300,
	},

	markdown = {
		update_delay = 300,
	},
})

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 25,
		side = 'left',
		mappings = {
			custom_only = false,
			list = {}
		}
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.fn.sign_define("DiagnosticSignError",
	{ text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
	{ text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
	{ text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
	{ text = "", texthl = "DiagnosticSignHint" })

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = 'local',
	sign_icons = {
		error = '✘',
		warn = '▲',
		hint = '⚑',
		info = ''
	}
})

lsp.on_attach(function(client, bufnr)
	require("aerial").on_attach(client, bufnr)

	vim.diagnostic.config({
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	})

	vim.cmd [[ ToggleDiagOn ]]
end)

lsp.setup()
