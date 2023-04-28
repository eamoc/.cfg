
" ---------------------------------------plugins----------------------------------------------------
call plug#begin($VIM_PLUGINS_DIR)
	Plug 'altercation/vim-colors-solarized'
	Plug 'neoclide/coc.nvim',{'branch':'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ctrlpvim/ctrlp.vim'
call plug#end()







" ---------------------------------------plugin-config----------------------------------------------------

"=== Conqueror of Completion ===
"



"=== Airline ===
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1				" automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#left_sep = ' '				" configure separators independently for the tabline, define straight tabs with |
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'			" format tab appearance. Other options options include 'jsformatter' and 'unique tail' 
let g:airline_powerline_fonts = 1					" automatically populate the g:airline_symbols dictionary with powerline symbols
let g:airline#extensions#coc#enabled = 1				" enable coc integration
let airline#extensions#coc#error_symbol = 'E:'				" set error symbol to 'E'
let airline#extensions#coc#warning_symbol = 'W:'			" set warning symbol to 'W'
let g:airline#extensions#coc#show_coc_status = 1			" enable coc status display 
let airline#extensions#coc#stl_format_err = '%C(L%L)'			" change the error format (%C - error count, %L - line number)
let airline#extensions#coc#stl_format_warn = '%C(L%L)'			" change the warning format (%C - error count, %L - line number)







augroup autosource 
	autocmd!
	autocmd BufWritePost plugin-config.vim source init.vim				" automatically source init.vim on save
augroup END
