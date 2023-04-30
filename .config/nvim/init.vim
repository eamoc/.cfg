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

nnoremap <SPACE> <Nop>							" unset any previous mapping to spacebar
let mapleader=' '							" set the leader key to the spacebar





" ---------------------------------------visuals----------------------------------------------------
set number relativenumber
set hlsearch								" enable search highlighting
set incsearch								" jump to first search term
set background=dark
colorscheme solarized





" ---------------------------------------split management----------------------------------------------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>							" simplify window navigation
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>





" ---------------------------------------mappings-------------------------------------------------------------
nmap <Leader>ev :bad $MYVIMRC<cr>					" open $MYVIMRC in a new buffer
nmap <Leader><space> :nohlsearch<cr>					" simple highlight removal






" ---------------------------------------auto-commands---------------------------------------------------------
augroup file_template
	autocmd!
	autocmd BufWritePost init.vim source %				" automatically source init.vim on save
augroup END

augroup autosource
	autocmd!
	autocmd BufNewFile *.sh 0r /home/eamoc/.config/nvim/templates/BASH_TEMPLATE
	autocmd BufNewFile *.html 0r /home/eamoc/.config/nvim/templates/HTML_TEMPLATE
	autocmd BufNewFile *.cpp 0r /home/eamoc/.config/nvim/templates/CPP_TEMPLATE
augroup END







"******************Tips n Tricks TNT*******************************
" gg go to top of file. 4gg goes to 4th line down
" gk gj move up or down one visual line, regardless of wrapped text
" g$ goes to end of line, g^ or g0 goes to beginning
" G go to bottom of file
" gf go to the file that the cursor is over
" gU capitakize a character
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
" daw deletes all the word. includes the white space after the word.
" diw ignore the white space
" das delete around a sentance
" dap delete aroud a paragraph
" c is the same as d except it leaves the user in insert mode
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
" To comment out a number of lines, put the cursor at the first column. do ctrl-v, then j down to last line press <shift> i
" Type in the comment  chars. Hit escape, et voila.
