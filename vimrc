"g0 srv vimrc
"[ "$EUID" -ne "0" ] &&  wget https://raw.githubusercontent.com/ipduh/various/master/vimrc -O ~/.vimrc  || wget https://raw.githubusercontent.com/ipduh/various/master/vimrc -O /etc/vim/vimrc.local

if has("syntax")
  syntax on
endif

set relativenumber
set number

set modeline
set modelines=5

"Two spaces tab
set shiftwidth=2
set tabstop=2

set expandtab

autocmd BufRead,BufNewFile   *.pl,*.c,*.h,*.sh,*.html,*.js set noic cin
autocmd BufRead,BufNewFile   *.py set shiftwidth=4 tabstop=4
autocmd BufRead,BufNewFile   Makefile set noexpandtab


"Search highlighting
set hlsearch

"C style indentation
set cindent

"show a visual line under the cursor's current line
set cursorline

"show the matching part of the pair for [] {} and ()
set showmatch

"Shift K for perldoc
set keywordprg=perldoc\ -f

let python_highlight_all = 1

"autocmd BufWritePost *.pl !chmod +x %
"autocmd BufWritePost *.sh !chmod +x %

"remove trailing space on :w
autocmd BufWritePre * :%s/\s\+$//e

