vim.g.tokyonight_style = "storm"

vim.cmd [[
	colorscheme onedarkpro
	" colorscheme dracula
	" colorscheme tokyonight
	set termguicolors
	autocmd Colorscheme * highlight NvimTreeNormal guibg=000000 guifg=000000
	highlight Normal guibg=none
	highlight NonText guibg=none
	highlight NvimTreeNormal guibg=none
	hi BufferTabpageFill guibg=000000
	
	" dark red
	hi tsxTagName guifg=#FF5555

	hi tsxComponentName guifg=#8BE9FD
	hi tsxCloseComponentName guifg=#8BE9DD

	" orange
	hi tsxCloseTagName guifg=#FF5555
	hi tsxAttributeBraces guifg=#F99575
	hi tsxEqual guifg=#F99575

	" yellow
	hi tsxAttrib guifg=#50FA7B cterm=italic
]]
