" __/\\\\\_____/\\\___/\\\________/\\\___/\\\\\\\\\\\___/\\\\____________/\\\\________________________/\\\\\\\\\_____________/\\\\\\\\\_        
"  _\/\\\\\\___\/\\\__\/\\\_______\/\\\__\/////\\\///___\/\\\\\\________/\\\\\\______________________/\\\///////\\\________/\\\////////__        
"   _\/\\\/\\\__\/\\\__\//\\\______/\\\_______\/\\\______\/\\\//\\\____/\\\//\\\_____________________\/\\\_____\/\\\______/\\\/___________      
"    _\/\\\//\\\_\/\\\___\//\\\____/\\\________\/\\\______\/\\\\///\\\/\\\/_\/\\\_____________________\/\\\\\\\\\\\/______/\\\_____________     
"     _\/\\\\//\\\\/\\\____\//\\\__/\\\_________\/\\\______\/\\\__\///\\\/___\/\\\_____________________\/\\\//////\\\_____\/\\\_____________    
"      _\/\\\_\//\\\/\\\_____\//\\\/\\\__________\/\\\______\/\\\____\///_____\/\\\_____________________\/\\\____\//\\\____\//\\\____________   
"       _\/\\\__\//\\\\\\______\//\\\\\___________\/\\\______\/\\\_____________\/\\\_____________________\/\\\_____\//\\\____\///\\\__________  
"        _\/\\\___\//\\\\\_______\//\\\_________/\\\\\\\\\\\__\/\\\_____________\/\\\___/\\\\\\\\\\\\\\\__\/\\\______\//\\\_____\////\\\\\\\\\_ 
"         _\///_____\/////_________\///_________\///////////___\///______________\///___\///////////////___\///________\///_________\/////////__
"
" ---------------------------------------basic ssettings----------------------------------------------------
source $HOME/.config/nvim/plugin-config.vim
let mapleader='<space>'							" set the leader key





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




" ---------------------------------------mappings----------------------------------------------------
nmap <Leader>ev :tabe $MYVIMRC<cr>					" open $MYVIMRC in a new tab 
nmap <Leader><space> :nohlsearch<cr>					" simple highlight removal





" ---------------------------------------auto-commands----------------------------------------------------
augroup file_mgmt 
	autocmd!
	autocmd BufWritePost init.vim source %				" automatically source init.vim on save
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
