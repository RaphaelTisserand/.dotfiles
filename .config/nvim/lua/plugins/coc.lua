return {
	"neoclide/coc.nvim",
	branch = "release",
	build = "npm install",
	event = { "BufReadPre", "BufNewFile" },

	config = function ()
		vim.cmd([[
	  " Utilise <Tab> pour la complétion
	  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	  inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	  " Valide la sélection avec Enter
	  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

	  " Jump vers les définitions
	  nmap <silent> gd <Plug>(coc-definition)
	  nmap <silent> gy <Plug>(coc-type-definition)
	  nmap <silent> gi <Plug>(coc-implementation)
	  nmap <silent> gr <Plug>(coc-references)
	  ]])
	end
}
