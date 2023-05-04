" _______________________________________________________________________________________        
"  _______________________________________________________________________________________       
"   __/\\\________________/\\\_____/\\\___________________________/\\\_____________________      
"    _\///___/\\/\\\\\\___\///___/\\\\\\\\\\\________/\\\____/\\\_\///_____/\\\\\__/\\\\\___     
"     __/\\\_\/\\\////\\\___/\\\_\////\\\////________\//\\\__/\\\___/\\\__/\\\///\\\\\///\\\_    
"      _\/\\\_\/\\\__\//\\\_\/\\\____\/\\\_____________\//\\\/\\\___\/\\\_\/\\\_\//\\\__\/\\\_   
"       _\/\\\_\/\\\___\/\\\_\/\\\____\/\\\_/\\__________\//\\\\\____\/\\\_\/\\\__\/\\\__\/\\\_  
"        _\/\\\_\/\\\___\/\\\_\/\\\____\//\\\\\____/\\\____\//\\\_____\/\\\_\/\\\__\/\\\__\/\\\_ 
"         _\///__\///____\///__\///______\/////____\///______\///______\///__\///___\///___\///__
"
" ---------------------------------------basic ssettings----------------------------------------------------
source $HOME/.config/nvim/plugin-config.vim

let g:mapleader = ","


" ---------------------------------------visuals----------------------------------------------------
filetype indent plugin on
set smartindent
set number relativenumber
set hlsearch								" enable search highlighting
set incsearch								" jump to first search term
set background=dark
colorscheme catppuccin-mocha





" ---------------------------------------split management----------------------------------------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>							" simplify window navigation
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





" ---------------------------------------mappings-------------------------------------------------------------
nmap <Leader>ev :e $MYVIMRC<cr>						" open $MYVIMRC
nmap <Leader>ep :e $HOME/.config/nvim/plugin-config.vim<cr>		" open plugin config file
nmap <Leader><space> :nohlsearch<cr>					" simple highlight removal





" ---------------------------------------auto-commands---------------------------------------------------------

 syntax: autocommand event pattern command

augroup C_Commands
	autocmd!
 	autocmd BufNewFile *.cpp 0r /home/eamoc/.config/nvim/templates/CPP_TEMPLATE
	autocmd FileType c nnoremap <Leader>c I//<Esc>
	autocmd FileType cpp nnoremap <Leader>c I//<Esc>
augroup END

augroup JavaScript_Commands
	autocmd!
	autocmd FileType javascript nnoremap <Leader>c I//<Esc>
augroup END

augroup HTML_Commands
	autocmd!
 	autocmd BufNewFile *.html 0r /home/eamoc/.config/nvim/templates/HTML_TEMPLATE
	autocmd BufWritePre *.html normal gg=G 					" = sign means format
	autocmd BufRead *.html normal gg=G 				
 	autocmd Filetype html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
	autocmd Filetype html inoremap ;i <em></em><Space><++><Esc>FeT>i
	autocmd Filetype html inoremap ;b <b></b<Space><++><Esc>FbT>i
	autocmd Filetype html inoremap ;p <p></p><Space><++><Esc>FpT>i
	autocmd FileType html nnoremap <Leader>c I<!--<Esc>A--><Esc>
augroup END

augroup Bash_Commands
	autocmd!
 	autocmd BufNewFile *.sh 0r /home/eamoc/.config/nvim/templates/BASH_TEMPLATE
augroup END

" augroup reloadinit
" 	autocmd!
" 	autocmd BufWritePost init.vim source %					" automatically source init.vim on save
" augroup END






"******************Tips n Tricks TNT*******************************
" gg go to top of file. 4gg goes to 4th line down
" gk gj move up or down one visual line, regardless of wrapped text
" g$ goes to end of line, g^ or g0 goes to beginning
" H, M, L jump to top middle or bottom of screen.
" G go to bottom of file
" gf go to the file that the cursor is over
" C-d go down half the screen
" C-u go up half the screen
" C-f full screen 'forwards'
" C-b full screen 'backwards'
" C-y C-e scroll down and up one line at a time
" zt bring line cursor is on to the top of the screen
" zz the middle
" zb the bottom
" gU capitalize a character
" gUis capitalise the entire sentence
" gu uncapitalize a character
" ^ brings you back to the previous file
" zz go to middle of file
" :e edit a file
" :w write a file
" :q quit :q! quit no save
" :wq write and quit
" :so % source the open file
" dd deletes a line. Note that this will include the carriage return.
" ^y$, ^d$ etc. go to the beginning of lie, start operation, complete until end of line. e.g. ^daw$, ^cip$ etc.
" dw deletes a word. in only deletes after the cursor
" daw deletes all the word. includes the white space after the word
" daW deletes every character up to and including the next white space
" diw ignore the white space
" das delete around a sentance
" dap delete aroud a paragraph
" vit select everything inside a tag
" vat include the tag as well
" vi( select the test inside parentheses. (Could also use  vi(
" vi{ select the text inside the curly braces
" vi" also single quoted strings and backticks
" vi[ etc, etc.
" vib select the text in parentheses.
" viB select the text insod eht ecurly braces
" c is the same as d except it leaves the user in insert mode
" y yanks, yy or Y yanks a line
" p pastes after the cursor.
" P pastes before the cursor
" a, A
" i, I
" . repeate the last command
" :bd delete buffer
" :bn next buffer
" :bp previous buffer
" :bN goto buffer N
" :ls list open buffers
" :tabn next tab8
" :tabp previous tab
" :tabc close tab
" :tabe <file> open a file on a new
" :. run the last command
" :sp create a split screen
" :vsp create a vertical split screen
"
" To comment out a number of lines, put the cursor at the first column. do ctrl-v, then j down to last line press
" <shift> i
" :I places the cursor at the beginning of the line and places it in insert mode
" Type in the comment chars. Hit escape, et voila.
"
" To find a piece of text, type '/'. If there is more than one result hit 'n' and 'p'
" :s%/pattern_to_search/pattern_to_replace/g 	Searcg for and replace text
" :set ft? querys the Filetype
"
"
"
"
