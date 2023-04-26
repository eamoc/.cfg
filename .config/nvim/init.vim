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
let mapleader=','							" set the leader key





" ---------------------------------------visuals----------------------------------------------------
set number
set relativenumber
set hlsearch								" enable search highlighting
set incsearch								" jump to first search term





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
augroup autosource 
	autocmd!
	autocmd BufWritePost init.vim source %				" automatically source init.vim on save
augroup END





" ---------------------------------------plugins----------------------------------------------------
call plug#begin($VIM_PLUGIN_DIR)
"	Plug 'tpope/vim-sensible'
call plug#end()






"******************Tips n Tricks *******************************
" gg go to top of file. 4gg goes to 4th line down
" G go to bottom of file
" zz go to middle of file
" :e edit a file
" :w write a file
" :q quit :q! quit no save
" :wq write and quit
" :so % source the open file
"
" :bn next buffer
" :bd delete buffer
" :bp previous buffer
" :bN goto buffer N
" :ls list open buffers
" :tabn next tab
" :tabp previous tab
" :tabc close tab
" :tabe <file> open a file on a new
" :. run the last command
" :sp create a split screen
" :vsp create a vertical split screen
