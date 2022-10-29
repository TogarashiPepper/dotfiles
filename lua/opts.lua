local vimify = require("utils").vimify

return (function()
	vim.cmd [[
		set ts=4 sw=4
		set relativenumber
		set mouse=a
		let g:NERDTreeFileExtensionHighlightFullName = 1
	]]

	vim.opt.undofile = true
	vim.o.ignorecase = true
	vim.o.smartcase = true
	vim.o.completeopt = "menuone,noselect"

	vim.wo.foldcolumn = '1'
	vim.wo.foldlevel = 50 -- Using ufo provider need a large value, feel free to decrease the value
	vim.wo.foldenable = true

	vim.cmd [[
		augroup remember_folds
			autocmd!
			autocmd BufWinLeave *.* mkview
			autocmd BufWinEnter *.* silent! loadview
			autocmd BufWinEnter *.* silent! goto 1
		augroup END

		autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
		autocmd BufWinEnter *.* silent! AerialOpen!
		autocmd BufWinEnter *.* silent! Neotree action=show
	]]

	vim.api.nvim_create_autocmd('BufWinEnter', {
		pattern = '*',
		callback = function()
			vim.notify(vim.bo.filetype)
			if vim.bo.filetype == 'NvimTree' then
				require 'bufferline.state'.set_offset(25, '')
			end
		end
	})

	vim.api.nvim_create_autocmd('BufWinLeave', {
		pattern = '*',
		callback = function()
			if vim.fn.expand('<afile>'):match('NvimTree') then
				require 'bufferline.state'.set_offset(0)
			end
		end
	})

	-- vim.o.background = "dark"

	-- map(";", ":NERDTree<CR>", description = "", opts = { silent = true })
	-- nmap("<Leader>cs", ":Lspsaga code_action<CR>",opts = { silent = true })
	-- nmap("<Leader>h",  ":Lspsaga hover_doc<CR>",  opts = { silent = true })
	-- nmap("<Leader>gd", ":Lspsaga lsp_finder<CR>", description = "", opts = { silent = true })
	require('legendary').setup({
		include_builtin = true,
		include_legendary_cmds = true,

		keymaps = {
			{ ";", ":NvimTreeToggle<CR>", description = "Find files", opts = { silent = true } },
			{ "<Leader>ff", ":Telescope live_grep<CR>", description = "Search File Content", opts = { silent = true } },
			{ "<Leader>lg", ":Legendary<CR>", description = "Open Legendary Menu", opts = { silent = true } },

			-- { "zM", require('ufo').closeAllFolds, description = "close all folds", opts = { silent = true } },
			-- { "zR", require('ufo').openAllFolds, description = "open all folds", opts = { silent = true } },

			{ "<Leader>ca", vim.lsp.buf.code_action, description = "Code Action", opts = { silent = true } },
			{ "<Leader>h", vim.lsp.buf.hover, description = "Hover", opts = { silent = true } },
			{ "<Leader>gd", vim.lsp.buf.definition, description = "Go to Definition", opts = { silent = true } },

			{ "KK", vimify "vim.diagnostic.open_float()", description = "Open Err/Info Window", opts = { silent = true } },

			{ "<Leader>w", ":BufferClose<CR>", description = "Close tab", opts = { silent = true } },
			{ "<Leader>t", ":enew<CR>", description = "Open Tab", opts = { silent = true } },

			{ "<Leader>1", ":BufferGoto 1<CR>", description = "Goto tab 1", opts = { silent = true } },
			{ "<Leader>2", ":BufferGoto 2<CR>", description = "Goto tab 2", opts = { silent = true } },
			{ "<Leader>3", ":BufferGoto 3<CR>", description = "Goto tab 3", opts = { silent = true } },
			{ "<Leader>4", ":BufferGoto 4<CR>", description = "Goto tab 4", opts = { silent = true } },
			{ "<Leader>5", ":BufferGoto 5<CR>", description = "Goto tab 5", opts = { silent = true } },
			{ "<Leader>6", ":BufferGoto 6<CR>", description = "Goto tab 6", opts = { silent = true } },
			{ "<Leader>7", ":BufferGoto 7<CR>", description = "Goto tab 7", opts = { silent = true } },
			{ "<Leader>8", ":BufferGoto 8<CR>", description = "Goto tab 8", opts = { silent = true } },
			{ "<Leader>9", ":BufferGoto 9<CR>", description = "Goto tab 9", opts = { silent = true } },
		}
	})
end)()
